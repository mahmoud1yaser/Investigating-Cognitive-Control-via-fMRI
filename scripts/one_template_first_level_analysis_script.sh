#!/usr/bin/sh

for idx in `seq -w 1 26` ; do
    sub="sub-$idx"

    echo " Start Skull striping of $sub"
    #Skull striping with fractional intensity of 0.3
    if [ ! -f /home/omar_saad/Tasks/Flanker_Dataset/SkullStripped/${subj}_T1w_brain_f03.nii.gz ]; then

    /home/omar_saad/fsl/bin/bet /home/omar_saad/Downloads/Data/sub-${idx}/anat/sub-${idx}_T1w /home/omar_saad/Tasks/Flanker_Dataset/SkullStripped/sub-${idx}_T1w_brain_f03  -f 0.3 -g 0

    fi

    echo " Start first level analysis of $sub"

    # Copy the design files into the subject directory.
	#copy Full desgin file
    cp /home/omar_saad/Tasks/Flanker_Dataset/one_design/full_design_run-1.fsf .

	# change “sub-01” to the current subject number in design files
    sed -i "s/sub-01/${sub}/g" full_design_run-1.fsf

        #run feat desgin files for run 1
    echo "===> Start run 1"
    feat full_design_run-1.fsf

	#change run1 to run2 in design file 
    sed -i "s/run1/run2/g" full_design_run-1.fsf
    sed -i "s/run-1/run-2/g" full_design_run-1.fsf

	#run feat desgin files
    echo "===> Start run 2"
    feat full_design_run-1.fsf
done
