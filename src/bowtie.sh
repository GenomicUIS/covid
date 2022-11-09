#!/bin/bash

#SBATCH --partition=normal
#SBATCH --job-name=bowtie2
#SBATCH --output=bowtie%.out
#SBATCH --error=bowtie%.err
#SBATCH --exclusive

#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@gmail.com

# Load the module
module load Bioinformatics/Bioconda/python3
source activate bowtie2

#Build a Bowtie index needed to align reads to that reference
bowtie2-build reference_sequence.fasta index_name
#Align the reads with the reference sequence
bowtie2 --no-unal -p 8 -x index_name -U reads.fastq -S output.sam


