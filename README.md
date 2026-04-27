# General Information
- We ran all of this using the U of U's CHPC server using SLURM jobs
- You can run the commands in the job files manually instead or queue the jobs making sure that your account has access to the same resources which are hardcoded into the .sh slurm job files. 
    - You can use `mychpc batch` to figure out what is available to you.

# Setting up source data
The data for this project is too large for GitHub or even free tier Google Drive, as such we require you to download the files for the data as follows. Do not change the names of any files.

This link contains the kindle book review data, download the file present at this kaggle link titled, "all_kindle_review .csv". Yes there is a space in the name, this is accounted for in the code. Don't change it.
https://www.kaggle.com/datasets/meetnagadia/amazon-kindle-book-review-for-sentiment-analysis

This link contains the Yelp business review data. Click the first "Download JSON" button. Once the zip file is downloaded, unzip it. We will use the file titled, "yelp_academic_dataset_review.json".
https://business.yelp.com/data/resources/open-dataset/

This link contains the IMDB movie review data. Download "part-01.json".
https://www.kaggle.com/datasets/ebiswas/imdb-review-dataset

From here, ssh into chpc by running the command `ssh <uid>@notchpeak2.chpc.utah.edu`.
Then run `git clone https://github.com/DJJ2244/CS4964-Senitment-Analysis.git`
We have already created a data folder, in any way that you want, either through the CHPC OnDemand website or through terminal, move the three data files into the 'data' folder inside this repository. We did: `scp <localpath> <your uid>@notchpeak2.chpc.utah.edu<absolute path to repo root>/data`

As an example here is what ours looked like for one of our uid's. `scp ~/Downloads/part-01.json u1234567@notchpeak2.chpc.utah.edu/~CS4964-Senitment-Analysis/data`.



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
sbatch finetine_model.sh
```

the resulting .ipynb will be in the output directory ready to be viewed.

# Data Licensing/Citation
