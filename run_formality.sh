#!/usr/bin/env bash
set -o pipefail

# Run from this directory so the complete Formality console output is saved here.
fm_shell -file run_formality.tcl 2>&1 | tee formality.log
