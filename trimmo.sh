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
