---
title: "Dasen lab, Pbx-mutant RNAseq", brachial
author: "Lisa Cohen"
output: html_document
---

Analysis file available for download here:
https://github.com/ljcohen/ljcohen.github.io/tree/master/analyses/Dasen/

Scripts associated with these analyses can be accessed here:
https://github.com/ljcohen/ljcohen.github.io/tree/master/analyses/Dasen/scripts/

# Introduction

This is an RNASeq differential expression analysis from paired-end 50 data from an Illumina HiSeq 2500 high-output sequencing run, Combo_HSQ_24 that took place at the NYU Genome Technology Center on November 18, 2014. The experiment consisted of RNA extracted from mutant mouse cells (TH-A-Mutant, TH-B-Mutant, TH-C-Mutant) compared to control (TH-A-Control, TH-B-Control, TH-C-Control). 

The BaseSpace link with run quality information is here:
https://basespace.illumina.com/s/nblJAnaXNEuX

# Table of Contents:
1. Data Analysis Procedure
2. PCA
3. MA plots
4. Heatmap
5. Contact
6. References

# 1. Data analysis procedure

For CPM data, the alignment program, Bowtie (version 1.0.0) was used with reads mapped to the Ensemble NCBIM37/mm9 (iGenome version) with two mismatches allowed. The uniquely-mapped reads were subjected to subsequent necessary processing, including removal of PCR duplicates, before transcripts were counted with htseq-count. Counts files were imported into the R statistical programming environment and analyzed with the DESeq2 R/Bioconductor package (Love et al. 2014).

Here, data analysis is presented from the thoarcic level. Data analysis for the thoracic level can be accessed here:

http://ljcohen.github.io/analyses/Dasen/Dasen_RNAseq_report_brachial.Rmd


Filenames containing raw transcript counts from htseq-count are as follows:

```
## [1] "TH-A-Control_counts.txt" "TH-A-Mutant_counts.txt" 
## [3] "TH-B-Control_counts.txt" "TH-B-Mutant_counts.txt" 
## [5] "TH-C-Control_counts.txt" "TH-C-Mutant_counts.txt"
```


# 2. PCA

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png) 




# 3. MA plots

The size of the table with all transcripts is: 

```
## [1] 15557    15
```

The size of the table with only significant transcripts, padj<0.05 is:

```
## [1] 129  15
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 


# 4. Heatmap


```
## NULL
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png) 

```
## NULL
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-2.png) 

```
## NULL
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-3.png) 


# 5. Contact

Lisa Cohen, PhD student in MCIP, UC Davis     
Phone: 321-427-9335       
Email: ljcohen@ucdavis.edu

### Sequencing and original bioinformatics analysis by:

NYU Langone Medical Center   
Bioinformatics Core, Genome Technology Center, OCS   
Email: Genomics@nyumc.org         
Phone: 646-501-2834   
http://ocs.med.nyu.edu/bioinformatics-core  
http://ocs.med.nyu.edu/genome-technology-center   

Dr. Steven Shen, Associate Professor      
Email: ShuQuan.Shen@nyumc.org  
Phone: 212-263-2234           
Genome Technology Center, Office of Collaborative Sciences
and Center for Health Informatics and Bioinformatics
NYU School of Medicine,
227 E30th Street, Room 748, 
New York, NY 10016



# 6. References

M. I. Love, W. Huber, S. Anders: Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2.
Genome Biology 2014, 15:550. http://dx.doi.org/10.1186/s13059-014-0550-8

R-Bioconductor: http://www.bioconductor.org/

DESeq2: http://www.bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.pdf
