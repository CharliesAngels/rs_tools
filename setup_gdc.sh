# ------------------------------------ Install pre-requisites -----------------
pip install numpy
pip install scipy

# ------------------------------------ Install gradunwarp ---------------------
cd /home/fs0/leahm/scratch/scripts
git clone https://github.com/Washington-University/gradunwarp.git
python setup.py install --prefix=/home/fs0/leahm/scratch/scripts

# ------------------------------------ Add gradunwapr paths to bash environment
# If file doesnt exist yet, create local profile: touch $HOME/.local_profile
vi $HOME/.local_profile
# Insert
PATH=$PATH:/home/fs0/leahm/scratch/scripts/gradunwarp/bin/: ; export PATH
# ------------------------------------ Add site-packages paths to PYTHONPATH (Python environment)
# Insert
PYTHONPATH=/home/fs0/leahm/scratch/scripts/gradunwarp/lib/python3.6/site-packages/ ; export PYTHONPATH

# ------------------------------------ Check that it worked -------------------
python
from gradunwarp.core import (coeffs)
# --> The error you're getting should be something that is NOT "ImportError: No module named gradunwarp.core"

# ------------------------------------ Install nibabel ------------------------
pip install nibabel --user
# Add to path
vi $HOME/.local_profile
# Insert
PATH=$PATH:/home/fs0/leahm/.local/bin/: ; export PATH

# ------------------------------------ Add biobank path to bash environment
# Insert
BB_BIN_DIR=/home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/ ; export BB_BIN_DIR
# Save (:wq)
# Check that it worked
cat /home/fs0/grigoras/.local_profile

# ------------------------------------------------------------------------------
# The only problem that the script might still run into is that the python version causes issues (I'm using Python 3.6.9).
# If that is the case, for now we have found a workaround where I run the script from my account on your files (leahm)
# Here, the GDC works.
# ------------------------------------------------------------------------------
# ------------------------------------ Get warp file
# (Workaround) Copy input file to working directory
scp /home/fs0/grigoras/scratch/fMRI/F3T_2018_018_004/images_004.nii.gz \
    /home/fs0/leahm/scratch/for_ioana/bb_GDC_wd/.

#  Run command to get warp file
$BB_BIN_DIR/bb_pipeline_tools/bb_GDC \
    --workingdir=/home/fs0/leahm/scratch/for_ioana/bb_GDC_wd \
    --in=/home/fs0/grigoras/scratch/fMRI/F3T_2018_018_004/images_004.nii.gz \
    --out=/home/fs0/leahm/scratch/for_ioana/bb_GDC_wd/images_004_ud \
    --owarp=/home/fs0/leahm/scratch/for_ioana/bb_GDC_wd/images_004_ud_warp

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
#                               Example for ioana:
# ------------------------------------------------------------------------------
vi $HOME/.local_profile
# Insert:
BB_BIN_DIR=/home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/ ; export BB_BIN_DIR
PATH=$PATH:/home/fs0/grigoras/scratch/scripts/gradunwarp/bin/ ; export PATH
PYTHONPATH=/home/fs0/grigoras/scratch/scripts/gradunwarp/lib64//python2.7/site-packages/ ; export PYTHONPATH
