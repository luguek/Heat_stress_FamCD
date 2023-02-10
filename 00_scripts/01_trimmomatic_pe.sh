#!/bin/bash
#PBS -N trimmomatic.__BASE__
#PBS -o 98_log_files/trimmomatic.__BASE__.out
#PBS -l walltime=02:00:00
#PBS -l mem=60g
#PBS -l ncpus=8
#PBS -q omp
#PBS -r n

cd $PBS_O_WORKDIR

#load environment trimmomatic



# Global variables

ADAPTERFILE="01_info_files/univec.fa"
NCPU=8
base="__BASE__"
Minbp=60
INPUTDIR="02_data"
OUTPUTDIR="03_trimmed"

# script

trimmomatic PE -Xmx55G \
        -threads $NCPU \
        -phred33 \
        "$INPUTDIR"/"$base"_R1.fastq.gz \
        "$INPUTDIR"/"$base"_R2.fastq.gz \
        "$OUTPUTDIR"/"$base"_R1.paired.fastq.gz \
        "$OUTPUTDIR"/"$base"_R1.single.fastq.gz \
        "$OUTPUTDIR"/"$base"_R2.paired.fastq.gz \
        "$OUTPUTDIR"/"$base"_R2.single.fastq.gz \
        ILLUMINACLIP:"$ADAPTERFILE":2:20:7 \
        LEADING:20 \
        TRAILING:20 \
        SLIDINGWINDOW:30:30 \
        MINLEN:"$Minbp"
#!/bin/bash
