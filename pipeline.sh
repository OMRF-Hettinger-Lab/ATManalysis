#!/usr/bin/bash -l 

#==============================================================================
# BASH Strict mode (i.e. "fail fast" to reduce hard-to-find bugs)
set -e          # EXIT the script if any command returns non-zero exit status.
set -E          # Make ERR trapping work inside functions too.
set -u          # Variables must be pre-defined before using them.
set -o pipefail # If a pipe fails, returns the error code for the failed pipe
                #  even if it isn't the last command in a series of pipes.

# load needed module(s)
module load slurm
module load R/4.4.1-mkl
module load seurat/5.1

#===============================================================================
# Allow running other scripts within the same directory as this script
#==========

# Capture name of the directory this script is located in and add it to PATH
export script_dir=$(dirname $(realpath $0))
export PATH="$script_dir:$PATH"
#------------------------------------------------------------------------------

mkdir -p results

cd results

# Download and unpack matrices (and wait until finished)
sbatch --wait unpack_raw.sh

# Build R obj
sbatch Notebook_S1_basic_Seurat_analysis.R
