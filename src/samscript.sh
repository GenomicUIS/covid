#!/bin/bash

#SBATCH --partition=normal
#SBATCH --job-name=samtools
#SBATCH --output=samtools%.out
#SBATCH --error=samtools%.err
#SBATCH --exclusive

#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@gmail.com

# Load the module
module load Bioinformatics/Bioconda/python3
source activate samtools_env

#convert de sam file to a bam file
samtools view -b -o file.bam file.sam

#check the mapping statistics
samtools flagstat file.bam

#sort the bam file
samtools sort -@ 8 -o file.sorted.bam file.bam

#index the sorter bam file
samtools index file.sorted.bam

#index the reference sequence
samtools faidx reference_sequence.fasta
