# RNASeq pipeline 
# Tuxedo pipeline
# Dasen lab
# 9/24/2014, paired-end
# Lisa Cohen
# Genome Technology Center
# NYU Langone Medical Center

import os

# import custom modules
import tuxedo
import files
import cluster
import samtools_picard
import igv


def tuxedo_pipeline_tophat_remdup_cufflinks(basedir,files_dictionary,files_dir,annotation,reference,reference_fasta):
    threads="8"
    process_name="tophat"
    #module_list=["cufflinks/2.2.0"]
    module_list=["bowtie2/2.1.0","tophat/2.0.9","cufflinks/2.2.0","samtools","picard-tools/1.88"]
    # makes a bunch of directories for file output:
    tuxedo_files_dir=basedir+"tuxedo/"
    cluster.check_dir(tuxedo_files_dir)
    #print tuxedo_files_dir
    tophat_dir=tuxedo_files_dir+"tophat/"
    cluster.check_dir(tophat_dir)
    #print tophat_dir
    cufflinks_dir=tuxedo_files_dir+"cufflinks/"
    cluster.check_dir(cufflinks_dir)
    #print cufflinks_dir
    transcripts_output={}
    duplicates_removed_bam_files={}
    for sample in files_dictionary.keys():
        #print sample
        # creates a dictionary that will be populated with cxb files
        file_list=files_dictionary[sample]
        #fastq_filename1=file_list[0]
        #fastq_filename2=file_list[1]
        #print file_list
        base_filename=sample
        #print base_filename
        # Separate directories have to be made in each process dir
        # because the output files are all genericaly named, e.g. transcripts.gtf, accepted_hits.bam, etc.
        
        # start tuxedo pipeline:
        # tophat --> remove_duplicates (2 picardtools strings) --> cufflinks --> cuffcompare --> cuffmerge --> cuffquant --> cuffdiff
        # 1. tophat
        tophat_outputdir=tophat_dir+base_filename+"/"
        cluster.check_dir(tophat_outputdir)
        #print tophat_outputdir
        #fastq_files_string=files.get_file_string(file_list)
        #print_string[1:]
        #tophat_string=tuxedo.get_tophat_string_annotation(reference,annotation,fastq_files_string[1:],tophat_outputdir)
        #tophat_output=tuxedo.get_tophat_output(tophat_outputdir)
        # 2. Remove duplicates with picardtools
        #picard_string1,picard_string2=samtools_picard.get_picard_string(basedir,tophat_output,tophat_outputdir,base_filename)
        duplicates_removed_bam=tuxedo.get_dupremoved_output(base_filename,tophat_outputdir)
        # 3. cufflinks
        #cufflinks_outputdir=cufflinks_dir+base_filename+"/"
        #cluster.check_dir(cufflinks_outputdir)
        #cufflinks_output=cufflinks_outputdir+"transcripts.gtf"
        #transcripts_output[sample]=cufflinks_output
        duplicates_removed_bam_files[sample]=duplicates_removed_bam
        #cufflinks_string=tuxedo.get_cufflinks_string(cufflinks_outputdir,duplicates_removed_bam)
        #print cufflinks_output
        #print os.path.isfile(cufflinks_output)
        #process_list=[tophat_string,picard_string1,picard_string2,cufflinks_string]
        #cluster.qsub_sge_file(basedir,process_name,module_list,base_filename,process_list,threads)
    return duplicates_removed_bam_files,transcripts_output

def assembly_file(transcripts_output,basedir):
    assembly_filename=assembly_file=basedir+"tuxedo/cufflinks/assemblies.txt"
    if os.path.isfile(assembly_filename)==False:
        # write a better test whether this exists
        # if yes, then check contents
        # do not append an existing assemblies.txt document, this could be bad!
        for sample in transcripts_output.keys():
            print sample
            transcripts_filename=transcripts_output[sample]
            print transcripts_filename
            tuxedo.create_assembly_file(transcripts_filename,assembly_filename)
        tuxedo.assembly_file_check(assembly_file)
    else:
        print "File exists:"
        print os.path.isfile(assembly_filename)
    return assembly_filename

def tuxedo_pipeline_cuffmerge(basedir,annotation,reference,reference_fasta,assembly_filename):
    threads="8"
    process_name="cuffmerge"
    module_list=["cufflinks/2.2.0"]
    base_filename="dasen2"
    cuffmerge_dir=basedir+"tuxedo/cufflinks/merged_asm/"
    cluster.check_dir(cuffmerge_dir)
    #print cuffmerge_dir
    # 5. cuffmerge - THIS HAS TO BE RUN AFTER CUFFLINKS AS A SEPARATE STEP, JUST ONCE!!!
    # produces a GTF file that contains all merged assemblies
    cuffmerge_string=tuxedo.get_cuffmerge_string(reference_fasta,annotation,assembly_filename,cuffmerge_dir)
    cuffmerge_output=cuffmerge_dir+"merge/merged.gtf"
    process_list=[cuffmerge_string]
    #cluster.qsub_sge_file(basedir,process_name,module_list,base_filename,process_list,threads)
    return cuffmerge_output
    
def tuxedo_pipeline_cuffcompare_cuffquant(basedir,transcripts_output,annotation,reference,reference_fasta,cuffmerge_file):
    threads="4"
    process_name="cuffquant"
    #module_list=["cufflinks/2.2.0"]
    module_list=["cufflinks/2.2.0"]
    # makes a bunch of directories for file output:
    tuxedo_files_dir=basedir+"tuxedo/"
    cluster.check_dir(tuxedo_files_dir)
    #print tuxedo_files_dir
    tophat_dir=tuxedo_files_dir+"tophat/"
    cluster.check_dir(tophat_dir)
    #print tophat_dir
    cufflinks_dir=tuxedo_files_dir+"cufflinks/"
    cluster.check_dir(cufflinks_dir)
    #print cufflinks_dir
    #print os.path.isfile(cufflinks_output)
    cuffcompare_dir=tuxedo_files_dir+"cuffcompare/"
    cluster.check_dir(cuffcompare_dir)
    #print cuffcompare_dir
    cuffdiff_outputdir=tuxedo_files_dir+"cuffdiff/"
    cluster.check_dir(cuffdiff_outputdir)
    #print cuffdiff_outputdir
    cuffquant_dir=tuxedo_files_dir+"cuffquant/"
    cluster.check_dir(cuffquant_dir)
    #print cuffquant_dir
    cxb_output={}
    for sample in transcripts_output.keys():
        base_filename=sample
        tophat_outputdir=tophat_dir+base_filename+"/"
        duplicates_removed_bam=tuxedo.get_dupremoved_output(base_filename,tophat_outputdir)
        # 4. cuffcompare
        #cuffcompare_outputdir=cuffcompare_dir+base_filename+"/"
        #cluster.check_dir(cuffcompare_outputdir)
        #cuffcompare_string=tuxedo.get_cuffcompare_string(annotation,cuffcompare_outputdir,cufflinks_outputdir)
        # 6. cuffquant
        cuffquant_outputdir=cuffquant_dir+base_filename+"/"
        cluster.check_dir(cuffquant_outputdir)
        cuffquant_string=tuxedo.get_cuffquant_string(cuffquant_outputdir,duplicates_removed_bam,cuffmerge_file)
        # populates a dictionary with cuffquant filenames to be used in cuffdiff
        cxb_filename=tuxedo.get_cuffquant_cxb_output(cuffquant_outputdir)
        #cxb_output[sample]=duplicates_removed_bam
        cxb_output[sample]=cxb_filename
        # processes: tophat --> remove_duplicates (2 picardtools strings) --> cufflinks --> cuffcompare --> cuffmerge --> cuffquant --> cuffdiff
        process_list=[cuffquant_string]
        #cluster.qsub_sge_file(basedir,process_name,module_list,base_filename,process_list,threads)

    return cxb_output

def get_lists_of_files_by_group(cxb_output):
    Control=""
    Mutant=""
    for sample in cxb_output.keys():
        sample_info=sample.split("-")
        print sample_info
        if sample_info[2]=="Control":
                Control+=cxb_output[sample]+","
        elif sample_info[2]=="Mutant":
                Mutant+=cxb_output[sample]+","
    return Mutant,Control

def groups_files(Mutant,Control):
    groupsoffiles=Mutant[:-1]+" "+Control[:-1]
    return groupsoffiles   

def run_cuffdiff(basedir,cxb_output,reference_fasta,cuffmerge_file):
    cuffdiff_outputdir=basedir+"tuxedo/cuffdiff/"
    cluster.check_dir(cuffdiff_outputdir)
    Mutant,Control=get_lists_of_files_by_group(cxb_output)
    labels="Mutant,Control"
    groupsoffiles=groups_files(Mutant,Control)
    cuffdiff_string=tuxedo.get_cuffdiff_string(basedir,cuffdiff_outputdir,groupsoffiles,reference_fasta,labels,cuffmerge_file)
    threads="32"
    process_name="cuffdiff"
    module_list=["cufflinks/2.2.0"]
    base_filename="dasen_MutantvsControl"
    process_list=[cuffdiff_string]
    #cluster.qsub_sge_file(basedir,process_name,module_list,base_filename,process_list,threads)

