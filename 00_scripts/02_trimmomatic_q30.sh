#!/usr/bin/env bash

# trimmomatic version 0.39
# trimmomatic manual : http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

WORKING_DIRECTORY=/scratch_vol1/fungi/Porifera_eDNA_multi_marker/01_raw_data
OUTPUT=/scratch_vol1/fungi/Porifera_eDNA_multi_marker/03_cleaned_data

ADAPTERFILE=/scratch_vol1/fungi/Porifera_eDNA_multi_marker/99_softwares/adapters_sequences.fasta

# Arguments :
# ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

eval "$(conda shell.bash hook)"
conda activate trimmomatic

cd $WORKING_DIRECTORY

####################################################
# Concatenated files for chimeric sequences creation
####################################################

cat $WORKING_DIRECTORY/BRG1V1_R1.fastq $WORKING_DIRECTORY/BRG1V3_R1.fastq > $WORKING_DIRECTORY/BRG1_all_R1.fastq
cat $WORKING_DIRECTORY/BRG1V3_R2.fastq $WORKING_DIRECTORY/BRG1V4_R2.fastq > $WORKING_DIRECTORY/BRG1_all_R2.fastq

cat $WORKING_DIRECTORY/BRG2V1_R1.fastq $WORKING_DIRECTORY/BRG2V3_R1.fastq > $WORKING_DIRECTORY/BRG2_all_R1.fastq
cat $WORKING_DIRECTORY/BRG2V3_R2.fastq $WORKING_DIRECTORY/BRG2V4_R2.fastq > $WORKING_DIRECTORY/BRG2_all_R2.fastq

cat $WORKING_DIRECTORY/BRG3V1_R1.fastq $WORKING_DIRECTORY/BRG3V3_R1.fastq > $WORKING_DIRECTORY/BRG3_all_R1.fastq
cat $WORKING_DIRECTORY/BRG3V3_R2.fastq $WORKING_DIRECTORY/BRG3V4_R2.fastq > $WORKING_DIRECTORY/BRG3_all_R2.fastq

####################################################
# Cleaning step
####################################################

## Sample BRG1 for 1) V1V3 marker, 2) V3V4 marker, 3) V3V4+ marker
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG1V1_R1.fastq $WORKING_DIRECTORY/BRG1V3_R2.fastq $OUTPUT/BRG1V1V3_R1.paired.fastq.gz $OUTPUT/BRG1V1V3_R1.single.fastq.gz $OUTPUT/BRG1V1V3_R2.paired.fastq.gz $OUTPUT/BRG1V1V3_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG1V3_R1.fastq $WORKING_DIRECTORY/BRG1V4_R2.fastq $OUTPUT/BRG1V4_R1.paired.fastq.gz $OUTPUT/BRG1V4_R1.single.fastq.gz $OUTPUT/BRG1V4_R2.paired.fastq.gz $OUTPUT/BRG1V4_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG1_all_R1.fastq $WORKING_DIRECTORY/BRG1_all_R2.fastq $OUTPUT/BRG1_all_R1.paired.fastq.gz $OUTPUT/BRG1_all_R1.single.fastq.gz $OUTPUT/BRG1_all_R2.paired.fastq.gz $OUTPUT/BRG1_all_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#
## Sample BRG2 for 1) V1V3 marker, 2) V3V4 marker, 3) V3V4+ marker
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG2V1_R1.fastq $WORKING_DIRECTORY/BRG2V3_R2.fastq $OUTPUT/BRG2V1V3_R1.paired.fastq.gz $OUTPUT/BRG2V1V3_R1.single.fastq.gz $OUTPUT/BRG2V1V3_R2.paired.fastq.gz $OUTPUT/BRG2V1V3_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG2V3_R1.fastq $WORKING_DIRECTORY/BRG2V4_R2.fastq $OUTPUT/BRG2V4_R1.paired.fastq.gz $OUTPUT/BRG2V4_R1.single.fastq.gz $OUTPUT/BRG2V4_R2.paired.fastq.gz $OUTPUT/BRG2V4_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG2_all_R1.fastq $WORKING_DIRECTORY/BRG2_all_R2.fastq $OUTPUT/BRG2_all_R1.paired.fastq.gz $OUTPUT/BRG2_all_R1.single.fastq.gz $OUTPUT/BRG2_all_R2.paired.fastq.gz $OUTPUT/BRG2_all_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
#
## Sample BRG3 for 1) V1V3 marker, 2) V3V4 marker, 3) V3V4+ marker
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG3V1_R1.fastq $WORKING_DIRECTORY/BRG3V3_R2.fastq $OUTPUT/BRG3V1V3_R1.paired.fastq.gz $OUTPUT/BRG3V1V3_R1.single.fastq.gz $OUTPUT/BRG3V1V3_R2.paired.fastq.gz $OUTPUT/BRG3V1V3_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG3V3_R1.fastq $WORKING_DIRECTORY/BRG3V4_R2.fastq $OUTPUT/BRG3V4_R1.paired.fastq.gz $OUTPUT/BRG3V4_R1.single.fastq.gz $OUTPUT/BRG3V4_R2.paired.fastq.gz $OUTPUT/BRG3V4_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150
trimmomatic PE -Xmx60G -threads 8 -phred33 $WORKING_DIRECTORY/BRG3_all_R1.fastq $WORKING_DIRECTORY/BRG3_all_R2.fastq $OUTPUT/BRG3_all_R1.paired.fastq.gz $OUTPUT/BRG3_all_R1.single.fastq.gz $OUTPUT/BRG3_all_R2.paired.fastq.gz $OUTPUT/BRG3_all_R2.single.fastq.gz ILLUMINACLIP:"$ADAPTERFILE":2:30:10 LEADING:30 TRAILING:30 SLIDINGWINDOW:26:30 MINLEN:150

