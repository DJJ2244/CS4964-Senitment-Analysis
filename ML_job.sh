#!/bin/bash
#SBATCH --job-name=fine_tune_distilbert
#SBATCH --time=02:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=16
#SBATCH --ntasks=1
#SBATCH --qos=notchpeak-gpu
#SBATCH --partition=notchpeak-gpu
#SBATCH --account=notchpeak-gpu
#SBATCH --gres=gpu:a100:2
#SBATCH --output=logs/slurm/%j.out
#SBATCH --error=logs/slurm/%j.err

module load python/3.13.5

source .venv/bin/activate

papermill ML.ipynb outputs/ml_output_${SLURM_JOB_ID}.ipynb