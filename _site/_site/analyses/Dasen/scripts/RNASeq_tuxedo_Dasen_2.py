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
import tuxedo_dasen2
import dasen_files2
import tuxedo
import igv

## reference files:
reference="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Sequence/Bowtie2Index/genome"
annotation="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Annotation/Genes/genes.gtf"
reference_fasta="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Sequence/Bowtie2Index/genome.fa"

# fastq files,
# use Lane 5 only
files_dir="/ifs/home/cohenl06/data/sequencing/dasen/thoracic/fastq/"
#print files_dir
basedir="/ifs/home/cohenl06/data/sequencing/dasen/thoracic/"
cluster.check_dir(files_dir)

files_list=os.listdir(files_dir)
#print files_list

def get_files_dictionary(files_list,files_dir):
    files_dictionary={}
    reads_dictionary={}
    for filename_short in files_list:
        filename=files_dir+filename_short
        #print files_dir
        #print filename
        #print os.path.isfile(filename)
        sample,read=dasen_files2.get_file_info(filename_short)
        if sample in files_dictionary.keys():
            if read=="R2":
                files_dictionary[sample].append(filename)
            else:
                for item in files_dictionary[sample]:
                    filename1=filename
                    filename2=item
                    files_dictionary[sample]=[filename1,filename2]
        else:
                files_dictionary[sample]=[filename]
        if read in reads_dictionary.keys():
            reads_dictionary[read].append(filename)
        else:
            reads_dictionary[read]=[filename]
    return files_dictionary

files_dictionary=get_files_dictionary(files_list,files_dir)
#print files_dictionary
#for sample in files_dictionary.keys():
#    print files_dictionary[sample]

duplicates_removed_bam,transcripts_files=tuxedo_dasen2.tuxedo_pipeline_tophat_remdup_cufflinks(basedir,files_dictionary,files_dir,annotation,reference,reference_fasta)
print duplicates_removed_bam

#igv.run_igvtools(basedir,duplicates_removed_bam)
#igv.get_big_wig(basedir,duplicates_removed_bam)
#print transcripts_files

#assembly_filename=tuxedo_dasen2.assembly_file(transcripts_files,basedir)
#print assembly_filename
#print os.path.isfile(assembly_filename)
#cuffmerge_file=tuxedo_dasen2.tuxedo_pipeline_cuffmerge(basedir,annotation,reference,reference_fasta,assembly_filename)
#print cuffmerge_file
#print os.path.isfile(cuffmerge_file)

#cxb_files=tuxedo_dasen2.tuxedo_pipeline_cuffcompare_cuffquant(basedir,transcripts_files,annotation,reference,reference_fasta,cuffmerge_file)
#print cxb_files

#tuxedo.alignment_table_file_tophat(basedir,files_dictionary)

#tuxedo_dasen2.run_cuffdiff(basedir,cxb_files,reference_fasta,cuffmerge_file)
