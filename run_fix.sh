# # ------------------------------------------------------------------------------
# Script name:  run_fix.sh
#
# Description:  Script to run fix with different thresholds.
#
#
# Author:       Caroline Nettekoven, 2020
#
# ------------------------------------------------------------------------------
# Run with threshold 20
cd /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/fix_logs/bb/new/rerun/troubleshooting
for melodic_folder in `ls -d /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/raw/sub-*/ses-*/func/*.ica`; do
    if [[ ! -f ${melodic_folder}/fix4melview_UKBiobank_thr20.txt ]]; then
        echo ${melodic_folder}
        echo Running fix...
        /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/fix/fix ${melodic_folder}  /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/training_files/UKBiobank.RData 20
        fsl_sub -q long.q /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/fix/fix ${melodic_folder}  /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/training_files/UKBiobank.RData 20
    fi
done

# From vncserver session
melodic_folder=/vols/Scratch/leahm/Joystick_Cereb-MRS/Data/bidsdir/raw/sub-16/ses-control/func/sub-16_ses-c_task-rest_acq-2_bold_func.ica/
if [[ ! -f ${melodic_folder}/fix4melview_UKBiobank_thr20.txt ]]; then
    echo ${melodic_folder}
    echo Running fix...
    /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/fix/fix ${melodic_folder}  /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/training_files/UKBiobank.RData 20
    fsl_sub -q long.q /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/fix/fix ${melodic_folder}  /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/training_files/UKBiobank.RData 20
fi
# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# Run with threshold 30 and threshold 10
cd /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/fix_logs/bb/new/rerun
fix_dir=/home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/code/UK_biobank_pipeline_v_1/bb_functional_pipeline/bb_fix_dir/
for melodic_folder in `ls -d /home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/raw/sub-0*/ses-*/func/*.ica`; do
    echo ${melodic_folder}

    if [[ ! -f ${melodic_folder}/fix4melview_UKBiobank_thr10.txt ]]; then

        melodic_folder=/home/fs0/leahm/scratch/Joystick_Cereb-MRS/Data/bidsdir/raw/sub-01/ses-control/func/sub-01_ses-c_task-rest_acq-1_bold_func.ica;
        fsl_sub -q long.q \
        ${fix_dir}/fix/fix \
        ${melodic_folder} \
        ${fix_dir}/training_files/UKBiobank.RData \
        30

        fsl_sub -q long.q \
        ${fix_dir}/fix/fix \
        ${melodic_folder} \
        ${fix_dir}/training_files/UKBiobank.RData \
        10

    fi
done


# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------
