# General Information
- We ran all of this using the U of U's CHPC server using SLURM jobs
- You can run the commands in the job files manually instead or queue the jobs making sure that your account has access to the same resources which are hardcoded into the .sh slurm job files. 
    - You can use `mychpc batch` to figure out what is available to you.
- Getting the source data and venv set up may take an extremely long time (1 hour +) if you have poor internet. Because of this, we have also included all our code as well as the outputs of our final notebook using the saved model from our training runs which displays our results to inspect.

# Setting up source data
The data for this project is too large for GitHub or even free tier Google Drive, as such we require you to download the files for the data as follows. Do not change the names of any files.

This link contains the kindle book review data, download the file present at this kaggle link. It will download a file named archive.zip, this opens up the archive file which contains `all_kindle_review .csv`. This is the file we wil use. **Yes there is a space in the name**, this is accounted for in the code. This should not be changed.
https://www.kaggle.com/datasets/meetnagadia/amazon-kindle-book-review-for-sentiment-analysis

This link contains the Yelp business review data. Click the first "Download JSON" button. Once the zip file is downloaded, unzip it. Inside of the resulting folder there is a yelp_dataset.tar file, expand this file. We will then use the file titled, `yelp_academic_dataset_review.json`.
https://business.yelp.com/data/resources/open-dataset/

This link contains the IMDB movie review data. Click download. Unzip the archive.zip folder, we will use the `part-01.json` file.
https://www.kaggle.com/datasets/ebiswas/imdb-review-dataset

From here through terminal, ssh into chpc by running the command `ssh <uid>@notchpeak2.chpc.utah.edu`.
Then run `git clone https://github.com/DJJ2244/CS4964-Senitment-Analysis.git` in the desired directory
run `cd CS4964-Senitment-Analysis`
Then run `pwd` and note this output for the next step
For all three data files:
- We have already created a data folder in the repository to house the data so in any way that you want, either through the CHPC OnDemand website or through terminal, move the three data files into the 'data' folder inside this repository. We ran the following command in the local terminal after logging out of the remote shell: `scp <localpath> <your uid>@notchpeak2.chpc.utah.edu:<absolute path to repo root>/data`
- As an example here is what ours looked like for one of our uid's. `scp ~/Desktop/School/CS4964/yelp_academic_dataset_review.json u1234567@notchpeak2.chpc.utah.edu:/uufs/chpc.utah.edu/common/home/u1234567/CS4964/CS4964-Senitment-Analysis/data`.

## End result
there should be three files in the data directory like the following:
```
data/
    yelp_academic_dataset_review.json
    part-01.json
    preprocessed_kindle_review .csv
```

# Setting up environment
All while in repo root (logged into chpc if working there)

To set up venv:
```bash
python -m venv .venv
```
- You might have to run `module load python/3.13.5` if python is not recognized on chpc

to activate:
```bash
source .venv/bin/activate
```
to install requirements
```bash
pip install -r requirements.txt
```
- This will take a while, ~10 minutes

Note: if you are going to queue the jobs, leave the venv with `deactivate`. Otherwise stay in the venv.

# Queuing jobs
**IMPORTANT!**: queue from repo root (pwd should end with the repo name). Ingoring this causes the kernel's path to be different than the relative path assumptions we made and the files will not be found

### Jobs:

```bash
sbatch data_processing_job.sh
```
above took about 10-15 minutes
once the above succeeded run (which is much longer):
```bash
sbatch ML_job.sh
```
- you can run `squeue -u $USER` to see if you job is running

the resulting .ipynb will be in the output directory ready to be viewed.

# Results
You can the results of our model after our own training runs by viewing the `ml_output_12386059.ipynb` file. In here you will see our ML training and evaluation code. Our results and graphs are displayed throughout this output notebook. This is so that you don't have to go through the long training process yourselves.

# Running demo file with saved model
- clone and open this repo
- go to https://drive.google.com/drive/folders/1UsUiULJ7CucsmALNPnFnwPg7IB0ZpG5D?usp=sharing and download the 4 files:
    - config.json
    - model.safetensors
    - tokenizer_config.json
    - tokenizer.json
- move those files to the repo directory of models/finetuned_distilbert
- activate the .venv (view instructions at the top under **Setting up environment** for help with this)
- ensure you have the necessary dependencies with `pip install torch transformers`
    - depending where your running it you might need to also install `pip install ipykernel`
- run cells sequentially and see their outputs

# Data Citation
Yelp Dataset: https://business.yelp.com/data/resources/open-dataset/
IMDB Dataset: https://www.kaggle.com/datasets/ebiswas/imdb-review-dataset
Kindle Dataset: https://www.kaggle.com/datasets/meetnagadia/amazon-kindle-book-review-for-sentiment-analysis

All of these sources had open use licenses.

