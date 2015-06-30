# Tuxedo pipeline to measure transcription variance in an RNASeq dataset
# Dasen lab
# 9/24/2014, paired-end
# Lisa Cohen
# Genome Technology Center
# NYU Langone Medical Center

import os

# custom sge cluster control module
import cluster

# custom project-specific modules:
import tuxedo_dasen
import dasen_files
import tuxedo
import igv

## reference files:
reference="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Sequence/Bowtie2Index/genome"
annotation="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Annotation/Genes/genes.gtf"
reference_fasta="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Sequence/Bowtie2Index/genome.fa"

#reference="/phoenix/iGenomes/Mus_musculus/UCSC/mm9/Sequence/Bowtie2Index/genome"
#annotation="/phoenix/iGenomes/Mus_musculus/UCSC/mm9/Annotation/Genes/genes.gtf"
#reference_fasta="/phoenix/iGenomes/Mus_musculus/UCSC/mm9/Sequence/Bowtie2Index/genome.fa"

#annotation="/ifs/data/sequence/share/GTC/Steve/mm9.gtf"

# fastq files:
results_files_dir="/ifs/data/sequence/results/dasenlab/2014-08-27/fastq/"
files_dir="/ifs/home/cohenl06/data/sequencing/dasen/merged/"
basedir="/ifs/home/cohenl06/data/sequencing/dasen/"
cluster.check_dir(files_dir)
# this is the list of raw files we're working with:
fileslist=os.listdir(results_files_dir)

# this will take raw files from the original directory, merge, and output to subdirectory in my home
files=dasen_files.merge_files(results_files_dir,files_dir,fileslist)
#print files

# need to write a different function so that the merged_files function doesn't have to be run each time
# files need to be indexed in order with R1 and R2 by each sample

#transcripts_files=tuxedo_dasen.tuxedo_pipeline_tophat_remdup_cufflinks(basedir,files,files_dir,annotation,reference,reference_fasta)
duplicates_removed_bam=tuxedo_dasen.tuxedo_pipeline_tophat_remdup_cufflinks(basedir,files,files_dir,annotation,reference,reference_fasta)
print duplicates_removed_bam

igv.run_igvtools(basedir,duplicates_removed_bam)
#igv.get_big_wig(basedir,duplicates_removed_bam)
#print transcripts_files

#assembly_filename=tuxedo_dasen.assembly_file(transcripts_files,basedir)
#print assembly_filename
#print os.path.isfile(assembly_filename)
#cuffmerge_file=tuxedo_dasen.tuxedo_pipeline_cuffmerge(basedir,annotation,reference,reference_fasta,assembly_filename)
#print cuffmerge_file
#print os.path.isfile(cuffmerge_file)

cxb_files=tuxedo_dasen.tuxedo_pipeline_cuffcompare_cuffquant(basedir,transcripts_files,annotation,reference,reference_fasta,cuffmerge_file)
#print cxb_files

#tuxedo.alignment_table_file(basedir,files)

#tuxedo_dasen.run_cuffdiff(basedir,cxb_files,reference_fasta,cuffmerge_file)
