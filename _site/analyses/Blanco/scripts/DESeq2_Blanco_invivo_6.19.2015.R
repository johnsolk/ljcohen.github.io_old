library(DESeq2)
library("GenomicFeatures")
library("genefilter")
library(gplots)
library(RColorBrewer)
source('~/Documents/scripts/plotPCAWithSampleNames.R')
source('~/Documents/scripts/overLapper_original.R')
# from Betul's script
setwd("~/Documents/NYUMC/Blanco/HTSeq_counts/duplicates_removed/invivo")
mypath<-"~/Documents/NYUMC/Blanco/HTSeq_counts/duplicates_removed/invivo"
filenames<-list.files(path=mypath, pattern= "counts.txt", full.names=FALSE)
datalist <-lapply(filenames, function(x){read.table(x,header=FALSE, sep="\t")})
for (i in 1:length(filenames))
{
  colnames(datalist[[i]])<-c("ID",filenames[[i]])
}
mergeddata <- Reduce(function(x,y) {merge(x,y, by="ID")}, datalist)
#write.table(mergeddata,  paste(path = mypath, "invivo_combine_count-data.txt", sep = ""),row.names = FALSE,  col.names = TRUE, sep = "\t")
new_data_merge<-mergeddata[-1:-5,]
rown<-new_data_merge$ID
rownames(new_data_merge)<-rown
new_data_merge<-new_data_merge[,-1]
head(new_data_merge)
data<-new_data_merge
colnames(data)
col.names<-c("ApoE.2","ApoE.3","ApoE.4","ApoE.5","ApoE.6","DKO.1","DKO.3","DKO.5","DKO.6","DKO.7","WT.1","WT.2","WT.3","WT.5","WT.6")



# Need to remove some outliers, PCA looks terrible (June 2015):



colnames(data)<-col.names
ExpDesign <- data.frame(row.names=colnames(data), condition = c("ApoE","ApoE","ApoE","ApoE","ApoE","DKO","DKO","DKO","DKO","DKO","WT","WT","WT","WT","WT"))
cds<-DESeqDataSetFromMatrix(countData=data, colData=ExpDesign,design=~condition)
cds<-DESeq(cds, betaPrior=FALSE)
log_cds<-rlog(cds)
plotPCAWithSampleNames(log_cds,intgroup="condition",ntop=40000)
# get norm counts
norm_counts<-counts(cds,normalized=TRUE)
norm_counts_data<-as.data.frame(norm_counts)
gene_names<-rownames(norm_counts_data)
norm_counts_data<-cbind(gene_names,norm_counts_data)
head(norm_counts_data)
filtered_norm_counts<-norm_counts_data[!rowSums(norm_counts_data[,2:16]==0)>=1, ]

# ApoE vs. WT
res1 <- results(cds, contrast=c("condition","ApoE","WT"))
res1_filtered<-subset(res1,res1$padj!="NA")
res1_filtered<-as.data.frame(res1_filtered)
gene_names<-rownames(res1_filtered)
res1_filtered<-cbind(res1_filtered,gene_names)
res1_filtered <- merge(filtered_norm_counts,res1_filtered,by="gene_names")
res1_filtered<-res1_filtered[order(res1_filtered$padj),]
dim(res1_filtered)
write.csv(res1_filtered,file="invivo_ApoE_WT_all_June2015.csv")
res1_filtered_padj<-subset(res1_filtered,res1_filtered$padj<0.25)
write.csv(res1_filtered_padj,file="invivo_ApoE_WT_padj0.25_June2015.csv")
dim(res1_filtered_padj)
plot(log2(res1_filtered$baseMean), res1_filtered$log2FoldChange, col=ifelse(res1_filtered$padj < 0.25, "red","gray67"),main="In vivo, ApoE vs. WT (padj<0.25)",xlim=c(1,20),ylim=c(-10,10),pch=20,cex=1)
abline(h=c(-1 ,1), col="blue")

# DKO vs. WT
res2 <- results(cds, contrast=c("condition","DKO","WT"))
res2_filtered<-subset(res2,res2$padj!="NA")
res2_filtered<-as.data.frame(res2_filtered)
gene_names<-rownames(res2_filtered)
res2_filtered<-cbind(res2_filtered,gene_names)
res2_filtered <- merge(filtered_norm_counts,res2_filtered,by="gene_names")
dim(res2_filtered)
res2_filtered<-res2_filtered[order(res2_filtered$padj),]
write.csv(res2_filtered,file="invivo_DKO_WT_all_June2015.csv")
res2_filtered_padj<-subset(res2_filtered,res2_filtered$padj<0.25)
dim(res2_filtered_padj)
write.csv(res2_filtered_padj,file="invivo_DKO_WT_padj0.25_June2015.csv")
plot(log2(res2_filtered$baseMean), res2_filtered$log2FoldChange, col=ifelse(res2_filtered$padj < 0.25, "red","gray67"),main="In vivo, DKO vs. WT (padj<0.25)",xlim=c(1,20),ylim=c(-10,10),pch=20,cex=1)
abline(h=c(-1 ,1), col="blue")


# ApoE vs. DKO
res3 <- results(cds, contrast=c("condition","ApoE","DKO"))
res3_filtered<-subset(res3,res3$padj!="NA")
res3_filtered<-as.data.frame(res3_filtered)
gene_names<-rownames(res3_filtered)
res3_filtered<-cbind(res3_filtered,gene_names)
res3_filtered <- merge(filtered_norm_counts,res3_filtered,by="gene_names")
dim(res3_filtered)
res3_filtered<-res3_filtered[order(res3_filtered$padj),]
write.csv(res3_filtered,file="invivo_ApoE_DKO_all_June2015.csv")
res3_filtered_padj<-subset(res3_filtered,res3_filtered$padj<0.25)
dim(res3_filtered_padj)
write.csv(res3_filtered_padj,file="invivo_ApoE_DKO_padj0.25_June2015.csv")

plot(log2(res3_filtered$baseMean), res3_filtered$log2FoldChange, col=ifelse(res3_filtered$padj < 0.25, "red","gray67"),main="In vivo, ApoE vs. DKO (padj<0.25)",xlim=c(1,20),ylim=c(-10,10),pch=20,cex=1)
abline(h=c(-1 ,1), col="blue")

###
# venn diagrams
###

# ApoE vs. WT
m<-res1_filtered_padj$gene_names
length(m)
# DKO vs. WT
n<-res2_filtered_padj$gene_names
length(n)
# ApoE vs. DKO
o<-res3_filtered_padj$gene_names
length(o)
setlist <- list(ApoE_WT=as.vector(m),DKO_WT=as.vector(n),ApoE_DKO=as.vector(o))
OLlist <- overLapper(setlist=setlist, sep="", type="vennsets")
counts <- sapply(OLlist$Venn_List, length)
vennPlot(counts=counts)



###
# ApoE vs. WT heatmap
# restrict to padj<0.01 and log2FC+-1

up_down_1FC<-subset(res1_filtered_padj,res1_filtered_padj$log2FoldChange>1 | res1_filtered_padj$log2FoldChange< -1)
write.csv(up_down_1FC,file="Blanco_invivo_ApoEvWT_padj0.25_log2FC1.csv")
#
d <- as.matrix(up_down_1FC[,c(2:6,12:16)])
rownames(d) <- up_down_1FC[,1]
d<-na.omit(d)
hr <- hclust(as.dist(1-cor(t(d), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.5))
clusterCols <- rainbow(length(unique(mycl)))
myClusterSideBar <- clusterCols[mycl]
myheatcol <- greenred(75)

heatmap.2(d, main="In vivo ApoE vs. WT, padj<0.25, log2FC +-1", 
          Rowv=as.dendrogram(hr),
          cexRow=0.15,cexCol=1.5,srtCol= 90,
          adjCol = c(NA,0),offsetCol=2.7, 
          Colv=NA, dendrogram="row", 
          scale="row", col=myheatcol, 
          density.info="none", 
          trace="none", RowSideColors= myClusterSideBar)
