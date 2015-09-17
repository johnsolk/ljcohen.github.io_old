library(DESeq2)
library("GenomicFeatures")
library("genefilter")
library(gplots)
library(RColorBrewer)
library(biomaRt)
source('~/Documents/scripts/plotPCAWithSampleNames.R')
# from Betul's script
# get merged data.frame of counts from each HTSeq output file 
setwd("~/Documents/NYUMC/Blanco/HTSeq_counts/duplicates_removed/invitro")
mypath<-"~/Documents/NYUMC/Blanco/HTSeq_counts/duplicates_removed/invitro"
filenames<-list.files(path=mypath, pattern= "counts.txt", full.names=FALSE)
datalist <-lapply(filenames, function(x){read.table(x,header=FALSE, sep="\t")})
for (i in 1:length(filenames))
{
  colnames(datalist[[i]])<-c("ID",filenames[[i]])
}
mergeddata <- Reduce(function(x,y) {merge(x,y, by="ID")}, datalist)
#write.table(mergeddata,  paste(path = mypath, "combine_count-data.txt", sep = ""),row.names = FALSE,  col.names = TRUE, sep = "\t")
#}
#
new_data_merge<-mergeddata[-1:-5,]
rown<-new_data_merge$ID
rownames(new_data_merge)<-rown
new_data_merge<-new_data_merge[,-1]
head(new_data_merge)
data<-new_data_merge
data<-data[,c(1:4,7:8)]
#col.names<-c("Exp.1.Basal","Exp.1.TW.100","Exp.2.Basal","Exp.2.TW.100","Exp.3.Basal","Exp.3.TW.100","Exp.4.Basal","Exp.4.TW.100")
# remove outlier Exp.3 samples:
col.names<-c("Exp.1.Basal","Exp.1.TW.100","Exp.2.Basal","Exp.2.TW.100","Exp.4.Basal","Exp.4.TW.100")
colnames(data)<-col.names


## need to make this paired design (June 2015):


ExpDesign <- data.frame(row.names=colnames(data), condition = c("Basal","TW.100","Basal","TW.100","Basal","TW.100"),experiment=c("Exp.1","Exp.1","Exp.2","Exp.2","Exp.4","Exp.4"))
ExpDesign
cds<-DESeqDataSetFromMatrix(countData=data, colData=ExpDesign,design=~experiment+condition)
cds<-DESeq(cds, betaPrior=FALSE)
# get norm counts
norm_counts<-counts(cds,normalized=TRUE)
norm_counts_data<-as.data.frame(norm_counts)
gene_names<-rownames(norm_counts)
norm_counts_data<-cbind(gene_names,norm_counts_data)
head(norm_counts_data)
filtered_norm_counts<-norm_counts_data[!rowSums(norm_counts_data[,2:7]==0)>=1, ]
head(filtered_norm_counts)



res1 <- results(cds)
res1_filtered<-subset(res1,res1$padj!="NA")
res1_filtered<-res1_filtered[order(res1_filtered$padj),]
#dim(res1_filtered)
res1_filtered_padj<-subset(res1_filtered,res1_filtered$padj<0.01)
#dim(res1_filtered_padj)

plot(log2(res1_filtered$baseMean), res1_filtered$log2FoldChange, col=ifelse(res1_filtered$padj < 0.01, "red","gray67"),main="In vitro, TW.100 vs. Basal (padj<0.01)",xlim=c(3,20),ylim=c(-10,10),pch=20,cex=1)
abline(h=c(-1 ,1), col="blue")

#log2 transformation
log_cds<-rlog(cds)
plotPCAWithSampleNames(log_cds,intgroup="condition",ntop=40000)


# merge counts and log2fc stats:
data<-as.data.frame(res1_filtered)
gene_names<-rownames(data)
data<-cbind(data,gene_names)
data_counts<-merge(data,filtered_norm_counts,by="gene_names")
data_counts<-data_counts[order(data_counts$padj),]
dim(data_counts)
write.csv(data_counts,file="invitro_all_June2015.csv")

data_padj<-as.data.frame(res1_filtered_padj)
gene_names<-rownames(data_padj)
data_padj<-cbind(data_padj,gene_names)
data_counts<-merge(data_padj,filtered_norm_counts,by="gene_names")
data_counts<-data_counts[order(data_counts$padj),]
dim(data_counts)
write.csv(data_counts,file="invitro_padj0.01_June2015.csv")

####

# restrict to padj<0.01 and log2FC+-1

up_down_1FC<-subset(data_counts,data_counts$log2FoldChange>1 | data_counts$log2FoldChange< -1)
write.csv(up_down_1FC,file="invitro_padj0.01_log2FC1_June2015.csv")
#
d <- as.matrix(up_down_1FC[,c(8:13)])
rownames(d) <- up_down_1FC[,1]
d<-na.omit(d)
d<-d[,c(1,3,5,2,4,6)]
colnames(d)<-c("Exp.1.Basal","Exp.2.Basal","Exp.4.Basal","Exp.1.TW.100","Exp.2.TW.100","Exp.4.TW.100")
hr <- hclust(as.dist(1-cor(t(d), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.5))
clusterCols <- rainbow(length(unique(mycl)))
myClusterSideBar <- clusterCols[mycl]
myheatcol <- greenred(75)
#png("Cd_heatmap.png", width = 7*300,height = 7*300,res = 1200,pointsize = 2) 
heatmap.2(d, main="In vitro TW-100 vs. Basal, padj<0.01, log2FC +-1", 
          Rowv=as.dendrogram(hr),
          cexRow=0.15,cexCol=0.8,srtCol= 90,
          adjCol = c(NA,0),offsetCol=2.5, 
          Colv=NA, dendrogram="row", 
          scale="row", col=myheatcol, 
          density.info="none", 
          trace="none", RowSideColors= myClusterSideBar)
#dev.off()