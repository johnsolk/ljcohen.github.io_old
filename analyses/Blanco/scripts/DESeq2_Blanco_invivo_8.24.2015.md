---
title: "Blanco-Colio lab, aortic tissue RNAseq"
author: "Lisa Cohen"
output: pdf_document
---

Analysis file available for download here:
https://github.com/ljcohen/ljcohen.github.io/tree/master/analyses/Blanco/

Script associated with this report can be accessed here:
https://github.com/ljcohen/ljcohen.github.io/tree/master/analyses/Blanco/scripts/DESeq2_Blanco_invivo_8.24.2015.Rmd

ApoE vs. WT


ApoE vs. DKO
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-1.png) ![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2-2.png) 

Size of data table, all ApoE vs. WT data

```
## [1] 16903    17
```

ApoE vs. WT, padj<0.25

```
## [1] 1364   17
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) ![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-2.png) 

Size of data table, all ApoE vs. DKO data

```
## [1] 15917    17
```

ApoE vs. DKO, padj<0.25

```
## [1] 106  17
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png) ![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-2.png) 



```
## [1] 1364
```

```
## [1] 106
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png) 




ApoE vs. WT heatmap
restrict to padj<0.01 and log2FC+-1


```
## NULL
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9-1.png) 
