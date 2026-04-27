# General Information
We ran all of this using U of U's CHPC. The heavy lifting was done using the .sh slurm jobs. You can run the commands in the jobs manually instead or queue the jobs making sure that your account has access to the same resources which are coded into the .sh slurm job files. you can use `mychpc batch` to figure out what is available to you.

# Setting up source data

# Setting up environment
To set up venv:
```
python -m venv .venv
```
to activate:
```
source .venv/bin/activate
```
to install requirements
```
pip install -r requirements.txt
```
