#!/usr/bin/sh

# calculate all zstats for cope 1 (incongruent)
cd Flanker_2nd_Level.gfeat/cope1.feat/stats/
fslmerge -t allZstats_cope1.nii.gz `ls zstat* | sort -V`
mv allZstats_cope1.nii.gz ../../..
cd ../../..
# calculate all zstats for cope 2 (congruent)
cd Flanker_2nd_Level.gfeat/cope2.feat/stats/
fslmerge -t allZstats_cope2.nii.gz `ls zstat* | sort -V`
mv allZstats_cope2.nii.gz ../../..
cd ../../..
# calculate all zstats for cope 3 (incongruent-congruent)
cd Flanker_2nd_Level.gfeat/cope3.feat/stats/
fslmerge -t allZstats_cope3.nii.gz `ls zstat* | sort -V`
mv allZstats_cope3.nii.gz ../../..
cd ../../..

# calculate Spherical Masks

# spherical mask jahn region  (45,73,58)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 45 1 73 1 58 1 0 1 Jahn_ROI_dmPFC_0_20_44.nii.gz -odt float
# sphere of radius 5mm
fslmaths Jahn_ROI_dmPFC_0_20_44.nii.gz -kernel sphere 5 -fmean Jahn_Sphere_dmPFC_0_20_44.nii.gz -odt float
fslmaths Jahn_Sphere_dmPFC_0_20_44.nii.gz -bin Jahn_Sphere_bin_dmPFC_0_20_44.nii.gz

# spherical mask Of region 1 (22,41,64) MNI coordinates (44,-44,56)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 22 1 41 1 64 1 0 1 ROI_1.nii.gz -odt float
# sphere of radius 5mm
fslmaths ROI_1.nii.gz -kernel sphere 5 -fmean ROI_1_Sphere.nii.gz -odt float
fslmaths ROI_1_Sphere.nii.gz -bin ROI_1_Sphere_bin.nii.gz

# spherical mask Of region 2 (19 29 34) MNI coordinates (52,-68,-4)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 19 1 29 1 34 1 0 1 ROI_2.nii.gz -odt float
fslmaths ROI_2.nii.gz -kernel sphere 5 -fmean ROI_2_Sphere.nii.gz -odt float
fslmaths ROI_2_Sphere.nii.gz -bin ROI_2_Sphere_bin.nii.gz

# spherical mask Of region 3 (45 72 58) MNI coordinates (0,18,44)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 45 1 72 1 58 1 0 1 ROI_3.nii.gz -odt float
fslmaths ROI_3.nii.gz -kernel sphere 5 -fmean ROI_3_Sphere.nii.gz -odt float
fslmaths ROI_3_Sphere.nii.gz -bin ROI_3_Sphere_bin.nii.gz

# spherical mask Of region 4 (60 32 61]) MNI coordinates (-30,-62,50)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 60 1 32 1 61 1 0 1 ROI_4.nii.gz -odt float
fslmaths ROI_4.nii.gz -kernel sphere 5 -fmean ROI_4_Sphere.nii.gz -odt float
fslmaths ROI_4_Sphere.nii.gz -bin ROI_4_Sphere_bin.nii.gz

# spherical mask Of region 5 (32 29 61) MNI coordinates (26,-68,50)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 32 1 29 1 61 1 0 1 ROI_5.nii.gz -odt float
fslmaths ROI_5.nii.gz -kernel sphere 5 -fmean ROI_5_Sphere.nii.gz -odt float
fslmaths ROI_5_Sphere.nii.gz -bin ROI_5_Sphere_bin.nii.gz

# spherical mask Of region 6 (69 26 29) MNI coordinates (-48,-74,-14)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 69 1 26 1 29 1 0 1 ROI_6.nii.gz -odt float
fslmaths ROI_6.nii.gz -kernel sphere 5 -fmean ROI_6_Sphere.nii.gz -odt float
fslmaths ROI_6_Sphere.nii.gz -bin ROI_6_Sphere_bin.nii.gz

# spherical mask Of region 7 (18 71 32) MNI coordinates (54,16,-8)
fslmaths $FSLDIR/data/standard/MNI152_T1_2mm.nii.gz -mul 0 -add 1 -roi 18 1 71 1 32 1 0 1 ROI_7.nii.gz -odt float
fslmaths ROI_7.nii.gz -kernel sphere 5 -fmean ROI_7_Sphere.nii.gz -odt float
fslmaths ROI_7_Sphere.nii.gz -bin ROI_7_Sphere_bin.nii.gz