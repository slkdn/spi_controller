#!/usr/bin/env bash
set -euo pipefail

# Run each unit/system testbench, collecting code coverage from RTL sources
# only, then generate a separate URG report for each DUT hierarchy.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

command -v vcs >/dev/null || { echo "Error: vcs is not in PATH" >&2; exit 1; }
command -v urg >/dev/null || { echo "Error: urg is not in PATH" >&2; exit 1; }

run_dir="$ROOT/coverage/run_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$run_dir"

rtl=(rtl/spi_clk_gen.sv rtl/spi_master.sv rtl/spi_slave.sv \
     rtl/spi_regs.sv rtl/spi_controller_core.sv rtl/spi_controller.sv)
tests=(spi_clk_gen_tb spi_master_tb spi_slave_tb spi_regs_tb spi_controller_tb)
vcs_opts=(-full64 -sverilog)

# FSDB is optional. By default the coverage run avoids a Verdi dependency;
# set FSDB=1 and VERDI_HOME (or NOVAS_HOME) to enable the testbench dumps.
if [[ "${FSDB:-0}" == "1" ]]; then
    verdi_root="${VERDI_HOME:-${NOVAS_HOME:-}}"
    pli_dir="$verdi_root/share/PLI/VCS/LINUX64"
    if [[ ! -f "$pli_dir/novas.tab" || ! -f "$pli_dir/pli.a" ]]; then
        echo "Error: FSDB=1 but Verdi PLI files not found under $pli_dir" >&2
        exit 1
    fi
    vcs_opts+=(-P "$pli_dir/novas.tab" "$pli_dir/pli.a")
else
    vcs_opts+=(+define+NO_FSDB)
fi

for top in "${tests[@]}"; do
    db="$run_dir/${top}.vdb"
    # Current layout keeps the scope files under coverage/; retain the old
    # root-level location as a fallback for checkouts made before the move.
    coverage_scope="$ROOT/coverage/coverage_scopes/${top}.cm_hier"
    if [[ ! -f "$coverage_scope" ]]; then
        coverage_scope="$ROOT/coverage_scopes/${top}.cm_hier"
    fi
    if [[ ! -f "$coverage_scope" ]]; then
        echo "Error: coverage scope file not found for $top" >&2
        exit 1
    fi
    vcs "${vcs_opts[@]}" -top "$top" -cm line+cond+tgl+branch \
        -cm_hier "$coverage_scope" \
        -cm_dir "$db" -Mdir="$run_dir/${top}.daidir" \
        -o "$run_dir/$top.simv" "${rtl[@]}" "tb/${top}.sv" \
        -l "$run_dir/${top}_compile.log"
    (cd "$run_dir" && "./$top.simv" -cm line+cond+tgl+branch -cm_dir "$db" \
        -l "${top}_run.log")
    # VCS can return 0 after a testbench $fatal, so do not rely on the exit
    # code alone: fail the regression when the run log contains a fatal.
    if grep -Eq '(^|[^A-Za-z])Fatal:' "$run_dir/${top}_run.log"; then
        echo "Error: $top reported a fatal error; see $run_dir/${top}_run.log" >&2
        exit 1
    fi
    # Each unit test has a different DUT hierarchy. Report its VDB on its
    # own so URG does not try to match unrelated instance paths. The per-test
    # -cm_hier file includes only the DUT instance subtree(s).
    # Keep both the detailed text report and the navigable HTML report.
    urg -dir "$db" -dbname "$top" -report "$run_dir/${top}_report" -format both
done

echo "Individual coverage reports: $run_dir/*_report"
