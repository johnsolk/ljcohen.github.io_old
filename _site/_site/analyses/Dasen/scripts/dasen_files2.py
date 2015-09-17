# RNASeq pipeline
# file processing for
# Tuxedo pipeline
# Dasen lab
# 9/24/2014, paired-end
# Lisa Cohen
# Genome Technology Center
# NYU Langone Medical Center

import cluster

def get_file_dictionaries(fileslist):
# need to fix this to accomodate more general file info list
# raw fastq is always: sample, barcode, lane, read
# need to be able to get single read file info
# but also merge R1 and R2 samples
    files={}
    for filename in fileslist:
        if filename.endswith(".fastq.gz"):
            file_info=filename.split("_")
            sample_num=file_info[0]
            if sample_num in files.keys():
                files[sample_num].append(filename)
            else:
                files[sample_num]=[filename]
    return files

def get_file_string(fileslist):
    file_string=""
    for filename in fileslist:
        file_string+=" "+filename
    return file_string

def get_file_info(filename):
    file_info=filename.split("_")
    sample=file_info[0]
    sample_info=sample.split("-")
    # mutant or control
    # replicate number
    replicate=file_info[1]
    barcode=file_info[1]
    lane=file_info[2]
    read=file_info[3]
    file_extension=file_info[4]
    file_data=(sample,barcode,lane,read,replicate)
    return sample,read

def get_merge_string(filesdir,merged_files_dir,filenames):
    # merges R1 from the same sample different lanes together
    # merges R2 from the same sample different lanes together
    # L005 must be first
    # L006 must be second
    file_string=get_file_string(filenames)
    filename=filenames[0]
    file_info=filename.split("_")
    sample_info=file_info[0]
    sample_dir=sample_info.split("/")
    sample=sample_dir[8]
    new_filename=merged_files_dir+sample+"_"+file_info[1]+"_"+file_info[3]+file_info[4][3:]
    merge_string=["zcat "+file_string[1:]+" | gzip > "+new_filename]
    return merge_string,new_filename

def get_base_filename(fastq_file):
    base_filename=fastq_file[-24:-19]
    return base_filename

def merged_files_dictionary(merged_file_list):
    sample_dict={}
    for filename in merged_file_list:
        sample=get_base_filename(filename)
        if sample in sample_dict.keys():
            sample_dict[sample].append(filename)
        else:
            sample_dict[sample]=[filename]
    return sample_dict 

def merge_files(filesdir,merged_files_dir,filelist):
    files=get_file_dictionaries(filelist)
    threads=str(2)
    process_name="merge_files"
    module_load=""
    merged_file_dictionary={}
    for sample in files.keys():
        R1_list=[]
        R2_list=[]
        for filename in files[sample]:
            file_info=get_file_info(filename)
            if file_info[3]=="R1":
                R1_list.append(filesdir+filename)
            if file_info[3]=="R2":
                R2_list.append(filesdir+filename)
        lists=[R1_list,R2_list]
        for read_list in lists:
            for fileslist in read_list:
                file_info_lane=fileslist.split("_")
                if file_info_lane[2]=="L005":
                    filename1=read_list[0]
                    filename2=read_list[1]
                    sample_files_temp=[filename1,filename2]
                if file_info_lane[2]=="L006":
                    filename1=read_list[1]
                    filename2=read_list[0]
                    sample_files_temp=[filename1,filename2]
            filenames=sample_files_temp
            merge_string,new_filename=get_merge_string(filesdir,merged_files_dir,filenames)
            #cluster.qsub_sge_file(merged_files_dir,process_name,module_load,sample,merge_string,threads)
            if sample in merged_file_dictionary.keys():
                merged_file_dictionary[sample].append(new_filename)
            else:
                merged_file_dictionary[sample]=[new_filename]
    return merged_file_dictionary

