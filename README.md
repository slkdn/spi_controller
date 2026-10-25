# APB-SPI Controller (16-bit, Nangate 45nm)

一个通过 APB3 从机接口配置的双角色 SPI 控制器：可工作在主机或从机模式，
支持 **16 位全双工**传输、Mode 0（CPOL=0 / CPHA=0）时序，并以
`spi_controller_core` 为目标完成 45nm 标准单元逻辑综合与形式验证。

## 当前状态（2026-10-21）

| 项目 | 结果 | 数据来源 |
| --- | --- | --- |
| 系统级全双工回环 | PASS（主机 RX = `A55A`，从机 RX = `3CC3`） | `coverage/run_20261019_214437/spi_controller_tb_run.log` |
| 单元级回归 | 4 / 5 PASS；`spi_regs_tb` 已修复，**待重跑** | 同上 |
| 逻辑综合 | 650 cells / 1331.86 µm²；20 条最差路径全部 MET，最小 slack **+1.10 ns** | `reports/area.rpt`、`reports/timing.rpt`（2026-10-16） |
| 功耗 | 210.98 µW（dynamic 186.31 + leakage 24.68），综合前 low-effort 估算 | `reports/power.rpt` |
| 形式验证 | `Verification SUCCEEDED`，207 个比较点全部通过 | `formal/formality.log` |

> 回归与综合均需 Linux EDA 环境（VCS / Verdi / DC / Formality）。本次修复是在
> Windows 侧完成的静态修改，未在本机重跑；上面的数字来自 2026-10-19 的
> 回归和 2026-10-16 的综合报告。

## 目录结构

```
rtl/        RTL 源码（6 个模块，综合目标为 spi_controller_core）
tb/         5 个 SystemVerilog testbench
synth/      DC 综合脚本 run_synth.tcl 与约束 spi_controller.sdc
output/     当前 16-bit core 的网表、综合后 SDC、Formality SVF
reports/    面积 / 时序 / 功耗报告
formal/     Formality 脚本与日志
coverage/   回归日志与 URG 覆盖率报告（coverage_scopes/ 为各测试的层次过滤）
doc/        中文完整版 PPT、英文 3 分钟版 PPT/PDF 及讲稿（含旧 8-bit 备份）
archive/    已淘汰的 8-bit 网表/SDC 与 Verdi 缓存，说明见 archive/README.md
```

## RTL 模块

| 模块 | 职责 |
| --- | --- |
| `spi_controller.sv` | 仿真用顶层封装，含三态 PAD 行为模型（不参与综合） |
| `spi_controller_core.sv` | 可综合核心，拆分 `*_i / *_o / *_oe`，无 inout |
| `spi_regs.sv` | APB3 从机、地址译码、寄存器读写、`0xDEADBEEF` 非法读 |
| `spi_master.sv` | 主模式状态机 IDLE → SHIFT → CS_HOLD，16-bit 移位 |
| `spi_slave.sv` | 从模式引擎，SCLK/CS_N 三级同步、MOSI 两级同步、边沿检测 |
| `spi_clk_gen.sv` | 可编程分频器，`SCLK period = 2 × clk_div × T_pclk` |

## 寄存器映射（APB 低 256 字节窗口）

| 偏移 | 名称 | 说明 |
| --- | --- | --- |
| `0x00` | SPI_CTRL | `[0] start`（写 1 自清零）、`[1] master_en`、`[15:8] clk_div`（硬件钳位 ≥ 20） |
| `0x04` | SPI_STATUS | `[0] busy`、`[1] done`、`[2] slave rx_valid` |
| `0x08` | SPI_TX_DATA | `[15:0]` 发送数据 |
| `0x0C` | SPI_RX_DATA | `[15:0]` 主机接收、`[31:16]` 从机接收 |

`clk_div` 默认 20，对应 SCLK 2.5 MHz，满足 25LC256 的 5 MHz 上限。

## 运行流程

回归 + 覆盖率（每个 testbench 单独编译、单独 URG 报告）：

```bash
./run_coverage.sh
# 可选：FSDB=1 VERDI_HOME=... ./run_coverage.sh
```

综合（在 `synth/` 下执行）：

```bash
cd synth
dc_shell -f run_synth.tcl
```

注意 `run_synth.tcl` 中的库路径目前固定为
`/proj/project/workarea/user37/spi_controller/lib/...`，换机器时需修改
`LIB_DIR`。

形式验证：

```bash
cd formal
./run_formality.sh
```

## 覆盖率解读

最近一次运行（`coverage/run_20261019_214437`）：

| Testbench | Score | 说明 |
| --- | --- | --- |
| `spi_clk_gen_tb` | 99.65 | toggle 98.61 |
| `spi_master_tb` | 93.18 | toggle 72.73，未覆盖全部移位数据组合 |
| `spi_slave_tb` | 99.04 | toggle 97.13 |
| `spi_controller_tb` | 71.64（系统级）/ **94.61（模块级）** | 系统级分数含两个 `spi_controller` 实例的 PAD wrapper；`urg` 的模块定义统计为 94.61 |
| `spi_regs_tb` | 37.48 | 旧版本在该测试中因 `$fatal` 提前退出，覆盖率不具代表性；修复后需重跑 |

## 已修复的问题（2026-10-21）

1. `tb/spi_regs_tb.sv:147`：原期望 `clk_div == 8`，但 RTL 最小钳位为 20。
   已改为期望 `8'd20`，同时保留“写低于下限的值仍被钳位”的覆盖。
2. `run_coverage.sh`：覆盖率 scope 路径改为当前布局
   `coverage/coverage_scopes/<test>.cm_hier`（保留旧路径回退），并在仿真后
   检查日志中的 `Fatal:`，避免 VCS 返回 0 时回归假通过。
3. `output/` 中旧的 8-bit 顶层网表与 SDC 已移至 `archive/legacy_8bit/`，
   避免与当前 16-bit core 产物混淆。
4. `sim/verdiLog/.verdi_onesearch_elabdir` 递归缓存已移至
   `archive/verdi_onesearch_cache/`，避免递归遍历报错。

## 待确认事项

- `synth/spi_controller.sdc` 中以下板级假设需按实际硬件复核：
  - `create_generated_clock -edges {41 81 121}` 按 `clk_div=20` 建模最快 SCLK；
  - MISO 输入延迟按 25LC256 “SO 在 SCK 下降沿后 100 ns 有效”，板级延迟暂按 0 ns；
  - APB 输入/输出各 4 ns 的外部延迟为假设值。
- `spi_regs_tb` 修复后尚未重跑，回归结论应以重跑结果为准。
- 功耗为综合阶段 low-effort 估算，布局布线后需用带寄生的网表复测。
