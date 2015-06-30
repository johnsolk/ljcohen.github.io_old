# Tuxedo pipeline to measure transcription variance in an RNASeq dataset
# Dasen lab
# 9/24/2014, paired-end
# Lisa Cohen
# Genome Technology Center
# NYU Langone Medical Center

import os
import dasen_files2
import cluster
import tuxedo

def tuxedo_pipeline_cuffcompare_cuffquant(basedir,sample_list:
    # makes a bunch of directories for file output:
    tuxedo_files_dir=basedir+"tuxedo/"
    cluster.check_dir(tuxedo_files_dir)
    print tuxedo_files_dir
    cuffdiff_outputdir=tuxedo_files_dir+"cuffdiff_controls/"
    cluster.check_dir(cuffdiff_outputdir)
    print cuffdiff_outputdir
    cuffquant_dir=tuxedo_files_dir+"cuffquant/"
    cluster.check_dir(cuffquant_dir)
    print cuffquant_dir
    cxb_output={}
    for sample in sample_list:
        # populates a dictionary with cuffquant filenames to be used in cuffdiff
        cxb_filename=tuxedo.get_cuffquant_cxb_output(cuffquant_outputdir)
        #cxb_output[sample]=duplicates_removed_bam
        cxb_output[sample]=cxb_filename
    return cxb_output

branchial_basedir="/ifs/home/cohenl06/data/sequencing/dasen/brachial/"

thoracic_filesdir="/ifs/home/cohenl06/data/sequencing/dasen/thoracic/fastq/"
thoracic_basedir="/ifs/home/cohenl06/data/sequencing/dasen/thoracic/"
thoracic_files=get_files_dictionary(thoracic_files_list,files_dir)
thoracic_files_list=[]
for filename in os.listdir(files_dir):
    if filename.endswith(".fastq")
        sample,read=dasen_files2.get_file_info(filename_short)
        if sample not in thoracic_files_list:                                       
            thoracic_samples_list.append(sample)
                                         
branchial_files=get_files_dictionary(branchial_samples_list,files_dir)

cxb_files=tuxedo_pipeline_cuffcompare_cuffquant(basedir,transcripts_files)
print cxb_files

tuxedo_dasen2.run_cuffdiff(basedir,cxb_files,reference_fasta,cuffmerge_file)
