#!/bin/bash
#SBATCH --job-name=data_processing
#SBATCH --time=08:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=4
#SBATCH --ntasks=1
#SBATCH --qos=notchpeak-guest
#SBATCH --partition=notchpeak-guest
#SBATCH --account=owner-guest
#SBATCH --output=logs/slurm/%j.out
#SBATCH --error=logs/slurm/%j.err

module load python/3.13.5

python -m pip install --user --quiet papermill

python -m papermill Final_Project_Data_Processing.ipynb outputs/output_${SLURM_JOB_ID}.ipynb