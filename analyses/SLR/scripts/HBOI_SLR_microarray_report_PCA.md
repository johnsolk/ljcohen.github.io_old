---
title: "HBOI, SLR project, microarray differential expression data analysis""
author: Lisa Cohen (ljcohen@ucdavis.edu)
date: "2015-06-13"
output: html_document
---



Analysis files available here for download:

https://github.com/ljcohen/ljcohen.github.io/tree/master/analyses/SLR

# Table of Contents:
1. Experiment Description
2. Lab Protocols
3. Data Collection
4. Raw Data QC
5. PCA Results Figures
6. Transcript-level expression for each chip
7. Results Files
8. Venn Diagram Results Figures
9. Comments
10. Contact
11. References

# 1. Experiment Description

This experiment consisted of hard coral samples, Orbicella faveolata collected from 3 sites (South, Ledge, Central) on the St. Lucie Reef on 3 different dates (June 2012, Oct 2012, Jan/Feb 2013). At least 4 samples at each site were collected from separate colonies for a total of 44 samples. 

The aim was to see if gene expression patterns were different in the samples based on spatial or temporal differences between samples. 

# 2. Lab Protocols

Coral samples were immediately preserved in the field in a guanidinium thiocyanate-phenol nucleic acid preservative, transported back to the lab on ice and stored at -80ºC. In a clean RNase free lab setting, phenol-chloroform extractions were performed on all samples. Aliquots were removed and chloroform added at a ratio of 1:5. RNA was separated in the aqueous layer, precipitated with ethanol and purified with LiCl. A NanoDrop® 1000 spectrophotometer (Thermo Fisher Scientific, Inc., MA USA) was used to quantify total RNA. Label-IT© (Mirus Bio LLC, Wisconsin, USA) nucleic acid labeling kit (MIR 3700) was used to covalently attach Cy™ 5 (excitation 650 nm and emission 670 nm) cyanine fluorescent dye at a frequency of one label about every 20-60 base pairs to 5µg of each sample.  Fluorescent dye labeling allows detection if binding occurs between complimentary RNA fragments in the sample and known oligonucleotides spotted on the microarray. Labeling was done according to the standard manufacturer’s protocol (Lit# ML002, Rev 11/15/06) and quantified on a NanoDrop® 1000 spectrophotometer, wavelengths 225-750 nm. All Cy™ 5-labeled total RNA samples were hybridized to custom anti-sense 4x2K oligonucleotide CustomArrays™ using methods described in the hybridization and imaging protocol (Ecogenomics, Inc., Japan). Total RNA samples were fragmented with 10X fragmentation reagent (buffered zinc solution) and stop solution (200 mM EDTA, pH 8.0) (Catalog #AM8740, Ambion®, Applied Biosystems, Texas, USA).   

# 3. Data Collection

Microarray chips were imaged at 635 nm using a high-resolution laser GenePix® 4200A microarray scanner (Axon, Molecular Devices, California, USA).  Data were extracted from images using GenePixPro 6.0 software as .gpr files.


```
## Error in file(file, "rt"): cannot open the connection
```

```
## Error in as.matrix(sample_info): object 'sample_info' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_matrix' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info' not found
```

```
## Error in as.data.frame(sample_info_matrix): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'sample_info_matrix' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in eval(expr, envir, enclos): object 'SLR_sum' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```


# 4. Raw Data QC:

Data were imported into the R statistical programming environment. The R-Bioconductor package, limma (Linear Models for Microarray Data, version 3.22.3, Ritchie et al. 2015; Smyth 2004) was used to assess the quality of the data and to analyze for differential expression. All data were shifted +1 to accomodate log2 transformation. These are the first 6 rows of shifted +1 raw microarray data (not log2 transformed): 




```
##                      1_4 1_3 1_2 1_1 2_4 2_3 2_2 2_1 3_4 3_3 3_2 3_1 4_4 4_3 4_2 4_1 5_4 5_3 5_2 5_1 6_4 6_3 6_2 6_1 7_4 7_3 7_2 7_1 8_4 8_3 8_2 8_1 9_4 9_3 9_2 9_1 10_4 10_3 10_2 10_1 11_4 11_3 11_2 11_1
## DkC.G11._17_51        14  10  28   2  11   6  15  12   9  13   6   3  13   6   9   5  19  10   8  20  12  12  10   5   8  13  15   1  18  19  17   7  16   6  18   7   10    7    4    4    7    8    2    4
## Ac_28_65_99           62  45  52   2  43  15  47  30  33  41  15   5  36  15  26   7  78  34  29  21  39  32  30  12  55  60  72  24  61  62  66  22  61  27  73  20   34   23   15    9   26   41   13   11
## Hsp27_cont.B1._17_51  24  20  37   2  26   8  19  17  19  21  11   5  21   8  11   6  44  20  20  20  26  21  18   9  20  30  32  13  37  38  27  12  33  11  30  14   21   13    8    4   19   20    8    4
## SedC.E9._131_165      36  20  70   3  24  11  30  22  29  25  14   8  27  12  17  10  51  26  27  20  35  27  25  13  29  31  26  10  60  64  36  16  45  12  31  17   31   18    8    6   24   28   13    5
## Ac_24_265_299         23  13  13   1  21   7  11   8  18  17   6   5  22  12  14   3  30  15  13  17  25  15  20   6  19  18  18   6  28  27  17   7  20   7  19   7   14    8    5    3   10   12    4    4
## Ac_3_209_243          10  10  23   1   8   2   7   7   9  11   4   3   8   4  10   4  13  11  10  15   7   6   4   5   8  16  22   5  12   9   6   4  10   5  20   7    9    4    4    3    7    8    4    3
```

Data were log2 transformed then normalized with 2 methods: the internal limma function "normalizeBetweenArrays" and the base R function, "normalizeCyclicLoess" Loess transformation. See "HBOI_SLR_microarray_log2_norm_results.ppt" and 3 arrayQualityMetrics reports for further details on the quality assessment of the raw data and why the Loess normalization method was chosen to smooth the data.

http://ljcohen.github.io/analyses/SLR/array_quality_metrics/QAreport_notransform/index.html

http://ljcohen.github.io/analyses/SLR/array_quality_metrics/QAreport_log2transform/index.html

http://ljcohen.github.io/analyses/SLR/array_quality_metrics/QAreport_log2transform_Loess/index.html

http://ljcohen.github.io/analyses/SLR/array_quality_metrics/QAreport_log2transform_normBetweenArrays/index.html

http://ljcohen.github.io/analyses/SLR/array_quality_metrics/HBOI_SLR_microarray_log2_norm_results.pptx.pdf

Typically, when data are noisy like this, and grouped slightly by technical variables such as hyb date and chip, normalization and removal of outliers can help with smoothing the data to pull out biological variation. (See Section 6.3 Between-Array Normalization of limma user guide: http://www.bioconductor.org/packages/release/bioc/vignettes/limma/inst/doc/usersguide.pdf)




Internal control probes were removed. These probes are supplied by the manufacturer and contain plant (SpkCtrl: RCP1| AF168390_1144_1178) and bacterial (SpkCtrl: NAC1| AF198054_481_515) sequences. We did not spike-in control RNA into these samples. Since total mRNA from corals potentially contain these sequences, we do typically see binding to these probes despite the absence of spike-in and they are not accurate to use as controls.


```
## Error in file(file, "rt"): cannot open the connection
```

```
## Error in as.vector(x, mode): cannot coerce type 'closure' to vector of type 'any'
```

```
## Error in as.data.frame(annotation_matrix): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'annotation_matrix' not found
```

```
## Error in make.names(annotation_dataframe$Name, unique = TRUE): object 'annotation_dataframe' not found
```

```
## Error in eval(expr, envir, enclos): object 'annotation_dataframe' not found
```

```
## Error in eval(expr, envir, enclos): object 'annotation_dataframe' not found
```

```
## Error in rownames(annotation_controls): error in evaluating the argument 'x' in selecting a method for function 'rownames': Error: object 'annotation_controls' not found
```

```
## Error in rownames(annotation_SedCC9): error in evaluating the argument 'x' in selecting a method for function 'rownames': Error: object 'annotation_SedCC9' not found
```

```
## Error in rownames(annotation_controls): error in evaluating the argument 'x' in selecting a method for function 'rownames': Error: object 'annotation_controls' not found
```


# 5. PCA results

Principal component analysis (PCA) reduces all expression data for each sample down to one point and compares samples in unitless vector space. The farther apart the samples are, the greater the differences there are in the data. When doing a differential expression analysis, it is important to understand where the variability is between samples so results can be interpreted accordingly. 

Variables such as chip, hyb date, site, sample collection date, and "var" (site and sample date combined) are color-coded in the PCA below to see if there are differences between groups. Chip and hyb date are technical groupings, so we do not expect to see these data clustered together. Site and sample collection date are both biological groupings. If these data appear to be grouped together, then we know differences in gene expression between samples are due to biological variation and not technical variation.

## chip

Data from chip2 appear to group together on the left along PC1 (the primary source of experimental variation). We could try to remove this chip as a potential outlier.


```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in t(x): object 'x' not found
```

```
## Error in colnames(x): error in evaluating the argument 'x' in selecting a method for function 'colnames': Error: object 'x' not found
```

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## hyb date

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```
## site

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## date

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## var

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

Since the data do not appear to strongly cluster together based on the biolgical groupings, site and sample collection date we will see if removing data from chip 2 will cause the data to become more spread apart, with greater differences between biological groups.


## chip

This time, we see that there are now several chips that group together along PC2 (the secondary source of variation in the experiment). We could try removing these later as well to see if the groupings will improve.


```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in t(x): object 'x' not found
```

```
## Error in colnames(x): error in evaluating the argument 'x' in selecting a method for function 'colnames': Error: object 'x' not found
```

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## hyb date

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```
## site

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## date

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## var

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```



Here, we will try removing data from chip 10 to see if this will imrove the groupings.

## chip




```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in t(x): object 'x' not found
```

```
## Error in colnames(x): error in evaluating the argument 'x' in selecting a method for function 'colnames': Error: object 'x' not found
```

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## hyb date

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## site

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## date

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

## var

```
## Error in as.data.frame(pca$x): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'pca' not found
```

# 6. Transcript-level expression for each chip
Transcript-level expression variability for each array used in the experiment. There are 150 transcripts represented on the microarray, with 15 spots per transcripts in 5 pieces (3 spots per piece). Box plots are mean, +- sd and min/max expression.


```
## Error in file(file, "rt"): cannot open the connection
```

```
## Error in annotation[!annotation$Probe == "Spkctrl", ]: error in evaluating the argument 'i' in selecting a method for function '[': Error in annotation$Probe : object of type 'closure' is not subsettable
```

```
## Error in eval(expr, envir, enclos): object 'annotation_minuscontrols' not found
```

```
## Error in as.character(names): cannot coerce type 'closure' to vector of type 'character'
```

```
## Error in eval(expr, envir, enclos): object 'annotation_minuscontrols' not found
```

```
## Error in colnames(annotation_minuscontrols_ID) <- col.names1: object 'annotation_minuscontrols_ID' not found
```

```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in as.data.frame(norm_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'norm_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data' not found
```

```
## Error in colnames(norm_data_ID) <- col.names2: object 'norm_data_ID' not found
```

```
## Error in merge(norm_data_ID, annotation_minuscontrols_ID, "ID"): object 'norm_data_ID' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in subset(norm_data_annotated, select = -Probe): object 'norm_data_annotated' not found
```

```
## Error in subset(norm_data_annotated, select = Probe): object 'norm_data_annotated' not found
```

```
## Error in aggregate(iris.x, iris.s, mean): object 'iris.x' not found
```

```
## Error in aggregate(iris.x, iris.s, sd): object 'iris.x' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data1) <- c("value1", "group1"): object 'array_data1' not found
```

```
## Error in as.data.frame(array_data1): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data1' not found
```

```
## Error in ggplot(aes(y = value1, x = factor(group1)), data = array_data1): object 'array_data1' not found
```

```
## Error in eval(expr, envir, enclos): object 'p1' not found
```

```
## Error in eval(expr, envir, enclos): object 'p1' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data2) <- c("value2", "group2"): object 'array_data2' not found
```

```
## Error in as.data.frame(array_data2): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data2' not found
```

```
## Error in ggplot(aes(y = value2, x = factor(group2)), data = array_data2): object 'array_data2' not found
```

```
## Error in eval(expr, envir, enclos): object 'p2' not found
```

```
## Error in eval(expr, envir, enclos): object 'p2' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p3' not found
```

```
## Error in eval(expr, envir, enclos): object 'p3' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p4' not found
```

```
## Error in eval(expr, envir, enclos): object 'p4' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p5' not found
```

```
## Error in eval(expr, envir, enclos): object 'p5' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p6' not found
```

```
## Error in eval(expr, envir, enclos): object 'p6' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p7' not found
```

```
## Error in eval(expr, envir, enclos): object 'p7' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p8' not found
```

```
## Error in eval(expr, envir, enclos): object 'p8' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p9' not found
```

```
## Error in eval(expr, envir, enclos): object 'p9' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p10' not found
```

```
## Error in eval(expr, envir, enclos): object 'p10' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p11' not found
```

```
## Error in eval(expr, envir, enclos): object 'p11' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p12' not found
```

```
## Error in eval(expr, envir, enclos): object 'p12' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p13' not found
```

```
## Error in eval(expr, envir, enclos): object 'p13' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p14' not found
```

```
## Error in eval(expr, envir, enclos): object 'p14' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p15' not found
```

```
## Error in eval(expr, envir, enclos): object 'p15' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p16' not found
```

```
## Error in eval(expr, envir, enclos): object 'p16' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p17' not found
```

```
## Error in eval(expr, envir, enclos): object 'p17' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p18' not found
```

```
## Error in eval(expr, envir, enclos): object 'p18' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p19' not found
```

```
## Error in eval(expr, envir, enclos): object 'p19' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p20' not found
```

```
## Error in eval(expr, envir, enclos): object 'p20' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p21' not found
```

```
## Error in eval(expr, envir, enclos): object 'p21' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p22' not found
```

```
## Error in eval(expr, envir, enclos): object 'p22' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p23' not found
```

```
## Error in eval(expr, envir, enclos): object 'p23' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p24' not found
```

```
## Error in eval(expr, envir, enclos): object 'p24' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p25' not found
```

```
## Error in eval(expr, envir, enclos): object 'p25' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p26' not found
```

```
## Error in eval(expr, envir, enclos): object 'p26' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p27' not found
```

```
## Error in eval(expr, envir, enclos): object 'p27' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p28' not found
```

```
## Error in eval(expr, envir, enclos): object 'p28' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p29' not found
```

```
## Error in eval(expr, envir, enclos): object 'p29' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p30' not found
```

```
## Error in eval(expr, envir, enclos): object 'p30' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p31' not found
```

```
## Error in eval(expr, envir, enclos): object 'p31' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p32' not found
```

```
## Error in eval(expr, envir, enclos): object 'p32' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p33' not found
```

```
## Error in eval(expr, envir, enclos): object 'p33' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p34' not found
```

```
## Error in eval(expr, envir, enclos): object 'p34' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p35' not found
```

```
## Error in eval(expr, envir, enclos): object 'p35' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated' not found
```

```
## Error in colnames(array_data) <- c("value", "group"): object 'array_data' not found
```

```
## Error in as.data.frame(array_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'array_data' not found
```

```
## Error in ggplot(aes(y = value, x = factor(group)), data = array_data): object 'array_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'p36' not found
```

```
## Error in eval(expr, envir, enclos): object 'p36' not found
```

# Results

These data do not group strongly by the biological variables: site, date, or combined site-date. We will make comparisons anyway to see if there are differences. 

Here we will create an interaction model, assuming a factorial design for the experiment. This is a 3 x 3 factorial design, even though there were no samples collected at the central site in Oct 2012. Differential expression models work by taking multiple pairwise comparisons, then looking at the overlap between the comparisons.

### By Transcript, 150 transcripts total on the array


```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in as.data.frame(norm_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'norm_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data' not found
```

```
## Error in colnames(norm_data_ID) <- col.names2: object 'norm_data_ID' not found
```

```
## Error in merge(norm_data_ID, annotation_minuscontrols_ID, "ID"): object 'norm_data_ID' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in subset(norm_data_annotated, select = -Probe): object 'norm_data_annotated' not found
```

```
## Error in subset(norm_data_annotated, select = Probe): object 'norm_data_annotated' not found
```

```
## Error in aggregate(iris.x, iris.s, mean): object 'iris.x' not found
```

```
## Error in aggregate(iris.x, iris.s, sd): object 'iris.x' not found
```

```
## Error in eval(expr, envir, enclos): object 'mean_probe' not found
```

```
## Error in eval(expr, envir, enclos): object 'mean_probe' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in unique.default(x, nmax = nmax): unique() applies only to vectors
```

```
## Error in model.frame.default(object, data, xlev = xlev): object is not a matrix
```

```
## Error in is(object, "list"): object 'mean_probe' not found
```

```
## Error in if (levels[1] == "(Intercept)") {: argument is of length zero
```

```
## Error in NCOL(fit$coefficients): object 'fit' not found
```

```
## Error in ebayes(fit = fit, proportion = proportion, stdev.coef.lim = stdev.coef.lim, : object 'fit2' not found
```

```
## Error in is(object, "MArrayLM"): object 'fit2' not found
```



```
## Error in is(object, "VennCounts"): object 'results' not found
```


```
## Error in if (levels[1] == "(Intercept)") {: argument is of length zero
```

```
## Error in NCOL(fit$coefficients): object 'fit' not found
```

```
## Error in ebayes(fit = fit, proportion = proportion, stdev.coef.lim = stdev.coef.lim, : object 'fit2' not found
```

```
## Error in is(object, "MArrayLM"): object 'fit2' not found
```


```
## Error in is(object, "VennCounts"): object 'results' not found
```

### By probe, 726 probes on the array

Mean of each probe piece (5 pieces per transcript) to see if there are measureable expression differences between groups. There are 726 probes per array.


```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in as.data.frame(norm_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'norm_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data' not found
```

```
## Error in colnames(norm_data_ID) <- col.names2: object 'norm_data_ID' not found
```

```
## Error in merge(norm_data_ID, annotation_minuscontrols_ID, "ID"): object 'norm_data_ID' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in subset(norm_data_annotated, select = -Name): object 'norm_data_annotated' not found
```

```
## Error in subset(norm_data_annotated, select = Name): object 'norm_data_annotated' not found
```

```
## Error in aggregate(iris.x, iris.s, mean): object 'iris.x' not found
```

```
## Error in aggregate(iris.x, iris.s, sd): object 'iris.x' not found
```

```
## Error in eval(expr, envir, enclos): object 'mean_probe' not found
```

```
## Error in eval(expr, envir, enclos): object 'mean_probe' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in unique.default(x, nmax = nmax): unique() applies only to vectors
```

```
## Error in model.frame.default(object, data, xlev = xlev): object is not a matrix
```

```
## Error in is(object, "list"): object 'mean_probe' not found
```

```
## Error in if (levels[1] == "(Intercept)") {: argument is of length zero
```

```
## Error in NCOL(fit$coefficients): object 'fit' not found
```

```
## Error in ebayes(fit = fit, proportion = proportion, stdev.coef.lim = stdev.coef.lim, : object 'fit2' not found
```

```
## Error in is(object, "MArrayLM"): object 'fit2' not found
```



```
## Error in is(object, "VennCounts"): object 'results' not found
```


```
## Error in if (levels[1] == "(Intercept)") {: argument is of length zero
```

```
## Error in NCOL(fit$coefficients): object 'fit' not found
```

```
## Error in ebayes(fit = fit, proportion = proportion, stdev.coef.lim = stdev.coef.lim, : object 'fit2' not found
```

```
## Error in is(object, "MArrayLM"): object 'fit2' not found
```


```
## Error in is(object, "VennCounts"): object 'results' not found
```

### By Function, 29 functions on the array

For example, nucleic acid modification, growth & development, etc.


```
## Error in eval(expr, envir, enclos): object 'SLR_matrix_minuscontrols' not found
```

```
## Error in as.data.frame(norm_data): error in evaluating the argument 'x' in selecting a method for function 'as.data.frame': Error: object 'norm_data' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data' not found
```

```
## Error in colnames(norm_data_ID) <- col.names2: object 'norm_data_ID' not found
```

```
## Error in merge(norm_data_ID, annotation_minuscontrols_ID, "ID"): object 'norm_data_ID' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in eval(expr, envir, enclos): object 'norm_data_annotated_all' not found
```

```
## Error in subset(norm_data_annotated, select = -Function): object 'norm_data_annotated' not found
```

```
## Error in subset(norm_data_annotated, select = Function): object 'norm_data_annotated' not found
```

```
## Error in aggregate(iris.x, iris.s, mean): object 'iris.x' not found
```

```
## Error in aggregate(iris.x, iris.s, sd): object 'iris.x' not found
```

```
## Error in eval(expr, envir, enclos): object 'mean_probe' not found
```

```
## Error in eval(expr, envir, enclos): object 'mean_probe' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in eval(expr, envir, enclos): object 'sample_info_dataframe' not found
```

```
## Error in unique.default(x, nmax = nmax): unique() applies only to vectors
```

```
## Error in model.frame.default(object, data, xlev = xlev): object is not a matrix
```

```
## Error in is(object, "list"): object 'mean_probe' not found
```

```
## Error in if (levels[1] == "(Intercept)") {: argument is of length zero
```

```
## Error in NCOL(fit$coefficients): object 'fit' not found
```

```
## Error in ebayes(fit = fit, proportion = proportion, stdev.coef.lim = stdev.coef.lim, : object 'fit2' not found
```

```
## Error in is(object, "MArrayLM"): object 'fit2' not found
```



```
## Error in is(object, "VennCounts"): object 'results' not found
```


```
## Error in if (levels[1] == "(Intercept)") {: argument is of length zero
```

```
## Error in NCOL(fit$coefficients): object 'fit' not found
```

```
## Error in ebayes(fit = fit, proportion = proportion, stdev.coef.lim = stdev.coef.lim, : object 'fit2' not found
```

```
## Error in is(object, "MArrayLM"): object 'fit2' not found
```



```
## Error in is(object, "VennCounts"): object 'results' not found
```

# 9. Comments

After looking over these results, let me know if you agree with the analysis methods or have any questions. Please feel free to suggest alternative methods.

# 10. Contact

Lisa Cohen,
Ph.D. student MCIP,
University of California, Davis
ljcohen@ucdavis.edu
321-427-9335

# 11. References

Izarry RA, Hobbs B, Collin F, Beazer-Barclay YD, Antonellis KJ, Scherf U, Speed TP. (2003). Exploration, normalization, and summaries of high density oligonucleotide array probe level data. Biostatistics. 2003 Apr;4(2):249-64. http://www.ncbi.nlm.nih.gov/pubmed/12925520

Ritchie, ME, Phipson, B, Wu, D, Hu, Y, Law, CW, Shi, W, and Smyth, GK (2015). limma powers differential expression analyses for RNA-sequencing and microarray studies. Nucleic Acids Research 43(7), e47. http://www.ncbi.nlm.nih.gov/pubmed/25605792

Smyth, G. K. (2004). Linear models and empirical Bayes methods for assessing differential expression in microarray experiments. Statistical Applications in Genetics and Molecular Biology, Vol. 3, No. 1, Article 3. http://www.ncbi.nlm.nih.gov/pubmed/16646809 http://www.statsci.org/smyth/pubs/ebayes.pdf

R-Bioconductor: http://www.bioconductor.org/

limma: http://www.bioconductor.org/packages/release/bioc/vignettes/limma/inst/doc/usersguide.pdf
