
#!/usr/bin/sh


for idx in `seq -w 1 26` ; do
    sub_idx="sub-$idx"
    echo $sub_idx
    echo "===> Starting Skull Striiping of $sub_idx with 0.3 f "

/home/omar_saad/fsl/bin/bet /home/omar_saad/Downloads/Data/sub-${idx}/anat/sub-${idx}_T1w /home/omar_saad/Tasks/Flanker_Dataset/SkullStripped/sub-${idx}_T1w_brain_f03  -f 0.3 -g 0

done
