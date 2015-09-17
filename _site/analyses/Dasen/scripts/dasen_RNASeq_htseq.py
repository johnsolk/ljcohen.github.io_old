# RNASeq pipeline
# HTSeq
# Dasen lab
# 11/10/2014, paired-end 50
# Lisa Cohen
# Genome Technology Center
# NYU Langone Medical Center

import cluster
import os
import tuxedo
import samtools_picard
import htseq

def get_fileslist(fileslist_all):
    fileslist=[]
    for filename in fileslist_all:
        if filename.endswith(".fastq.gz"):
            file_info=filename.split("_")
            if file_info[3]=="R1":
                fileslist.append(filesdir+filename)
    return fileslist
            
def gunzip_files(basedir,fileslist):
    gunzip_files_list=[]
    for filename in fileslist:
        newfile=filename[:-3]
        gunzip_files_list.append(newfile)
        gunzip_string="gunzip -c "+filename+" > "+newfile
        process_name="gunzip"
        module_name_list=[]
        filename=filename[-29:-13]
        process_string=[gunzip_string]
        threads=str(1)
        #cluster.qsub_sge_file(basedir,process_name,module_name_list,filename,process_string,threads)
    return gunzip_files_list

def parse_files(filename):
    file_info=filename.split("/")
    sample_info=file_info[9].split("_")
    sample=sample_info[0]
    read=file_info[3]
    return sample,read

def get_file_dictionaries(fileslist):
    count=0
    sample_count=0
    files_dictionary={}
    for filename in fileslist:
        count+=1
        sample,read=parse_files(filename)
        if sample not in files_dictionary.keys():
            files_dictionary[sample]=[filename]
            sample_count+=1
    print "This is the number of files:",count
    print "This is the number of samples:",sample_count
    return files_dictionary

def get_file_string(fileslist):
    file_string=""
    for filename in fileslist:
        file_string+=" "+filename
    return file_string

def run_bowtie1_htseq(sample_dictionary,annotation,reference,basedir,aligned_files_dir):
    module_list=["igenomes/1","samtools","bowtie/0.12.9","picard-tools/1.88"]
    threads=str(8)
    process_name="bowtie1_R1"
    for sample in sample_dictionary.keys():
        sam_filename=aligned_files_dir+sample+".sam"
        fastq_file=sample_dictionary[sample][0]
        bowtie1_string=tuxedo.get_bowtie1_string_single(aligned_files_dir,reference,fastq_file,sam_filename)
        #bowtie1_string=tuxedo.get_bowtie1_string_paired(aligned_files_dir,reference,fastq_file_list,sam_filename)
        sam_bam_string,bam_filename=samtools_picard.get_samtools_bam_string(aligned_files_dir,sam_filename)
        sorted_bam_string,sorted_bam_filename=samtools_picard.get_samtools_sort_string(aligned_files_dir,bam_filename,sample)
        picard_string1,picard_string2=samtools_picard.get_picard_string(basedir,sorted_bam_filename,aligned_files_dir,sample)
        remdups_bam=aligned_files_dir+sample+".dedup.bam"
        htseq_string=htseq.get_htseqcount_string(basedir,remdups_bam,annotation,sample)
        process_string=[bowtie1_string,sam_bam_string,sorted_bam_string,picard_string1,picard_string2,htseq_string]
        #process_string=[htseq_string]
        cluster.qsub_sge_file(basedir,process_name,module_list,sample,process_string,threads)

def get_sample_data():
    files_dir="/ifs/home/cohenl06/data/sequencing/park/fastq/sge_files/"
    filenames=["bowtie1_R1_2.sge.e313699","bowtie1_R1_1.sge.e313697","bowtie1_R1_3.sge.e313698","bowtie1_R1_6.sge.e313703","bowtie1_R1_12.sge.e313696","bowtie1_R1_7.sge.e313702","bowtie1_R1_9.sge.e313704","bowtie1_R1_10.sge.e313695","bowtie1_R1_8.sge.e313705","bowtie1_R1_5.sge.e313700","bowtie1_R1_4.sge.e313701","bowtie1_R1_11.sge.e313694"]
    sample_data_dictionary={}
    for filename in filenames:
        file_data1=filename.split("_")
        print file_data1
        file_data2=file_data1[2].split(".")
        print file_data2
        sample_data=file_data2[0]
        sample_data_dictionary[sample_data]=files_dir+filename
    return sample_data_dictionary

def get_duplicates_removed(aligned_files_dir,sample):
    duplicates_removed_file=aligned_files_dir+"picard_metrics/"+sample+".dups.txt"
    print duplicates_removed_file
    line_data={}
    line_num=0
    if os.path.isfile(duplicates_removed_file)==True:
        with open(duplicates_removed_file) as datafile:
            for line in datafile:
                print line
                line_num+=1
                line_data[line_num]=line.split()
    else:
        print os.path.isfile(duplicates_removed_file)
    duplicates_removed=line_data[8][8]
    print duplicates_removed
    return duplicates_removed

def get_alignment_data(sample_data_dictionary,aligned_files_dir):
    alignment_table_filename=basedir+"alignment_stats.txt"
    header=["sample","dups removed","reads","reads with 1 alignment","% with 1 alignment","reads failed to align","% reads failed to align","reads suppressed due to -m","% reads suppressed due to -m"]
    with open(alignment_table_filename,"w") as datafile:
        datafile.write("\t".join(header))
        datafile.write("\n")
        for sample in sample_data_dictionary:
            print "Sample:",sample
            filename=sample_data_dictionary[sample]
            data_list=tuxedo.get_bowtie1_alignment_data(filename)
            print data_list
            duplicates_removed=get_duplicates_removed(aligned_files_dir,sample)
            datafile.write(sample+"\t")
            datafile.write(duplicates_removed+"\t")
            datafile.write("\t".join(data_list))
            datafile.write("\n")
    datafile.close()
    print "Alignment stats written:",alignment_table_filename

filesdir="/ifs/home/cohenl06/data/sequencing/dasen/thoracic/fastq/"
basedir="/ifs/home/cohenl06/data/sequencing/dasen/thoracic/htseq/"
reference="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Sequence/BowtieIndex/genome"
annotation="/phoenix/iGenomes/Mus_musculus/Ensembl/NCBIM37/Annotation/Genes/genes.gtf"
aligned_files_dir=basedir+"bowtie1_aligned_files/"
cluster.check_dir(aligned_files_dir)
fileslist_all=os.listdir(filesdir)
fileslist=get_fileslist(fileslist_all)
print fileslist
gunzip_files_list=gunzip_files(basedir,fileslist)
files_dictionary=get_file_dictionaries(gunzip_files_list)
print files_dictionary
run_bowtie1_htseq(files_dictionary,annotation,reference,basedir,aligned_files_dir)
#get_alignment_data(get_sample_data(),aligned_files_dir)
