# General Information
We ran all of this using U of U's CHPC. The heavy lifting was done using the .sh slurm jobs. You can run the commands in the jobs manually instead or queue the jobs making sure that your account has access to the same resources which are coded into the .sh slurm job files. you can use `mychpc batch` to figure out what is available to you.

# Setting up source data

# Setting up environment
To set up venv:
```bash
python -m venv .venv
```
to activate:
```bash
source .venv/bin/activate
```
to install requirements
```bash
pip install -r requirements.txt
```
Note: if you are going to queue the jobs, leave the venv with `deactivate`. Otherwise stay in the venv.

# Queuing jobs
From project root:
```bash
sbatch data_processing_job.sh
```
once succeeded run
```bash
finetine_model.sh
```

the resulting .ipynb will be in the output directory ready to be viewed.