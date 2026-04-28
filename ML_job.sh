#!/bin/bash
#SBATCH --job-name=fine_tune_distilbert
#SBATCH --time=10:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --ntasks=1
#SBATCH --qos=notchpeak-gpu-guest
#SBATCH --partition=notchpeak-gpu-guest
#SBATCH --account=owner-gpu-guest
#SBATCH --gres=gpu:rtx6000:1
#SBATCH --output=logs/slurm/%j.out
#SBATCH --error=logs/slurm/%j.err

module load python/3.13.5

source .venv/bin/activate

papermill ML.ipynb outputs/ml_output_${SLURM_JOB_ID}.ipynb