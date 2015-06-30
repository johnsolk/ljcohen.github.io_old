# with help from:
# https://insilicodb.com/compare-deg-signatures/
# http://cran.r-project.org/web/packages/colorfulVennPlot/colorfulVennPlot.pdf
library(limma)
library(gplots)
library(colorfulVennPlot)
library(venneuler)
setwd("~/Documents/Blanco/results_sent")
raw_ApoE_WT<-read.csv("sig_genes_WT_ApoE.csv",sep=",")
raw_DKO_WT<-read.csv("sig_genes_WT_DKO.csv",sep=",")
gene.ApoE_WT<-raw_ApoE_WT$gene
gene.DKO_WT<-raw_DKO_WT$gene
gene_union<-union(gene.ApoE_WT,gene.DKO_WT)
ApoE_WT<-array(0,dim=c(length(gene_union)))
ApoE_WT<-cbind(ApoE_WT,gene_union)
DKO_WT<-array(0,dim=c(length(gene_union)))
DKO_WT<-cbind(DKO_WT,gene_union)
#when there is a match between gene.ApoE_WT and gene_union, ApoE_WT will be set = 1
ApoE_WT[match(gene.ApoE_WT,gene_union)]=1
#when there is a match between gene.DKO_WT and gene_union, DKO_WT will be set = 1
DKO_WT[match(gene.DKO_WT,gene_union)]=1
match_both<-intersect(gene.DKO_WT,gene.ApoE_WT)
DKO<-setdiff(gene.DKO_WT,gene.ApoE_WT)
ApoE<-setdiff(gene.ApoE_WT,gene.DKO_WT)
#limma package vennDiagram
venncounts_all<-cbind(ApoE_WT,DKO_WT)
venncounts=vennCounts(venncounts_all)
vennDiagram(venncounts)
# gplots venn
combined<-cbind(ApoE_WT,DKO_WT)
combined_data.frame<-as.data.frame(combined)
combined_data.frame<-combined_data.frame[,1:3]
rown<-combined_data.frame[,2]
combined_data.frame<-combined_data.frame[,-2]
rownames(combined_data.frame)<-rown
venn(combined_data.frame)
# cluster analysis
y<-raw_DKO_WT
sample.dist <-dist(t(y))
sample.clust <- hclust(sample.dist, method = "complete")
plot(sample.clust)