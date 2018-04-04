#!/bin/bash

# Run Trimmomatic on all fastq files in a directory (on treebeard server)

for i in *.fastq;
do
	echo working with "$i"
	newfile="$(basename $i .fastq)"
    java -jar /opt/Trimmomatic-0.35/trimmomatic-0.35.jar SE -phred33 ${newfile}.fastq ${newfile}.trimmo.fastq ILLUMINACLIP:/opt/Trimmomatic-0.35/adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:4:5 LEADING:5 TRAILING:5 MINLEN:25
done;


#[loga8761s@treebeard raw]$ java -jar /opt/Trimmomatic-0.35/trimmomatic-0.35.jar 
#Usage: 
#       PE [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-quiet] [-validatePairs] [-basein <inputBase> | <inputFile1> <inputFile2>] [-baseout <outputBase> | <outputFile1P> <outputFile1U> <outputFile2P> <outputFile2U>] <trimmer1>...
#   or: 
#       SE [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-quiet] <inputFile> <outputFile> <trimmer1>...

# using MacManes default parameters in trinity
# single end file only
# java -jar /opt/Trimmomatic-0.35/trimmomatic-0.35.jar SE -phred33 CLMP001A_S52_L005_R1_001.fastq CLMP001A_S52_L005_R1_001_trimmo.fastq ILLUMINACLIP:/opt/Trimmomatic-0.35/adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:4:5 LEADING:5 TRAILING:5 MINLEN:25

# Trimmomatic manual here:
# http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

# This will perform the following steps in this order:
# 1. Remove Illumina adapters provided in TruSeq3-SE.fa (provided)
#    note: Trimmomatic will look for seed matches (16 bases) allowing maximally 2 mismatches. 
#    These seeds will be extended and clipped if in the case of paired end reads a score of 
#    30 is reached (about 50 bases), or in the case of single ended reads a score of 10 (about 17 bases)
# 2. Remove leading low quality or N bases (below quality 5)
# 3. Remove trailing low quality or N bases (below quality 5)
# 4. Scan the read with a 4 base wide sliding window, cutting when the average quality per base drops below 5
# 5. Drop reads which are less than 25 bases long after these steps
