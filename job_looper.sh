#!/bin/bash  
#used to submit large number of jobs to the batch queue via job_submit.csh.  1 job per input file.
#don't change count and nJob they are just for initialization of labels

submit_script="job_submit9.sh"

#test_pilot=false
test_pilot=true

if [ "$test_pilot" == true ]; then
    ./$submit_script "ttH-powheg" 0 0
else
    
#################
##ttH-powheg
#################
    SAMPLE="ttH-powheg"
    #files = 80
    let jobs=40
    let files_per_job=2
    let start_file=0
    #let end_file=$start_file
    let end_file=files_per_job-1
    let COUNT=0
    while [ $COUNT -lt $jobs ]; do
	let COUNT++
	bsub -J "$SAMPLE_$COUNT" -q 1nh "$submit_script $SAMPLE $start_file $end_file"
        #./$submit_script $SAMPLE $start_file $end_file
	let start_file+=files_per_job
	let end_file+=files_per_job
    done


#################
##ttbar-semiLep-pwoheg
#################
    SAMPLE="ttbar-semiLep-powheg"
    let jobs=82
    let files_per_job=7
    let start_file=0
#let end_file=$start_file
    let end_file=files_per_job-1
    let COUNT=0
    while [ $COUNT -lt $jobs ]; do
	let COUNT++
	bsub -J "$SAMPLE_$COUNT" -q 1nh "$submit_script $SAMPLE $start_file $end_file"
    #./$submit_script $SAMPLE $start_file $end_file
	let start_file+=files_per_job
	let end_file+=files_per_job
    done
    
#################
##ttW
#################
# SAMPLE="ttW"
# let jobs=7
# let files_per_job=1
# let start_file=0
# #let end_file=$start_file
# let end_file=files_per_job-1
# let COUNT=0
# while [ $COUNT -lt $jobs ]; do
#     let COUNT++
#     bsub -J "$SAMPLE_$COUNT" -q 1nh "$submit_script $SAMPLE $start_file $end_file"
#     #./$submit_script $SAMPLE $start_file $end_file
#     let start_file+=files_per_job
#     let end_file+=files_per_job
# done

fi
