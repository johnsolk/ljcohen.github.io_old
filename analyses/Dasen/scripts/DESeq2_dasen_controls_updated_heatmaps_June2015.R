library(DESeq2)
library(biomaRt)
source('~/Documents/scripts/plotPCAWithSampleNames.R')
setwd("~/Documents/NYUMC/Dasen/controls/htseq_counts")
mypath<-"~/Documents/NYUMC/Dasen/controls/htseq_counts"
filenames<-list.files(path=mypath, pattern= "_counts.txt", full.names=FALSE)
datalist <-lapply(filenames, function(x){read.table(x,header=FALSE, sep="\t")})
for (i in 1:length(filenames))
{
  colnames(datalist[[i]])<-c("ID",filenames[[i]])
}
mergeddata <- Reduce(function(x,y) {merge(x,y, by="ID")}, datalist)
new_data_merge<-mergeddata[-1:-5,]
#write.csv(new_data_merge,file="Dasen_thoracic_count_data_Ensembl.csv")
rown<-new_data_merge$ID
rownames(new_data_merge)<-rown
new_data_merge<-new_data_merge[,-1]
head(new_data_merge)
data<-new_data_merge
colnames(data)
col.names<-c("BR-A-Control","BR-B-Control","BR-C-Control","TH-A-Control","TH-B-Control","TH-C-Control")
colnames(data)<-col.names
colnames(data)
ExpDesign <- data.frame(row.names=colnames(data), condition = c("BR-Control","BR-Control","BR-Control","TH-Control","TH-Control","TH-Control"))
cds<-DESeqDataSetFromMatrix(countData=data, colData=ExpDesign,design=~condition)
cds$condition <- relevel(cds$condition, "TH-Control")
cds<-DESeq(cds, betaPrior=FALSE)
# log2 transformation for PCA plot
log_cds<-rlog(cds)
plotPCAWithSampleNames(log_cds, intgroup="condition", ntop=40000)
###
# get normalized counts
norm_counts<-counts(cds,normalized=TRUE)
ensembl_id<-rownames(norm_counts)
norm_counts_data<-as.data.frame(norm_counts)
norm_counts_data<-cbind(norm_counts_data,ensembl_id)
head(norm_counts_data)

# get gene name from Ensembl gene ID
ensembl=useMart("ensembl")
ensembl = useDataset("mmusculus_gene_ensembl",mart=ensembl)
query<-getBM(attributes=c('ensembl_gene_id','external_gene_name','gene_biotype'), filters = 'ensembl_gene_id', values = ensembl_id, mart=ensembl)
col.names<-c("ensembl_id","external_gene_id","gene_biotype")
colnames(query)<-col.names
###
merge_biomart_res_counts <- merge(norm_counts_data,query,by="ensembl_id")
head(merge_biomart_res_counts)
temp_data_merged_counts<-merge_biomart_res_counts
#write.csv(temp_data_merged_counts,"Dasen_replicate_norm_counts.csv")
head(temp_data_merged_counts)
##
#res<-results(cds,contrast=c("condition","BR-Control","TH-Control"))
res<-results(cds)
resultsNames(cds)
### generate MA plots
plot(log2(res$baseMean), res$log2FoldChange, col=ifelse(res$padj < 0.05, "red","gray67"),main="(DESeq2) Brachial Control vs. Thoracic Control (padj<0.05)",xlim=c(1,15),ylim=c(-3,3),pch=20,cex=1)
abline(h=c(-1,1), col="blue")
###
res_ordered<-res[order(res$padj),]
ensembl_id<-rownames(res_ordered)
res_ordered<-as.data.frame(res_ordered)
res_ordered<-cbind(res_ordered,ensembl_id)
head(res_ordered)
merge_biomart_res_counts <- merge(temp_data_merged_counts,res_ordered,by="ensembl_id")
merge_biomart_res_all<-subset(merge_biomart_res_counts,merge_biomart_res_counts$padj!="NA")
merge_biomart_res_all<-merge_biomart_res_all[order(merge_biomart_res_all$padj),]
head(merge_biomart_res_all)
#write.csv(merge_biomart_res_all,"Dasen_BR-Control_vs_TH-Control_CPM_all.csv")
res_merged_cutoff<-subset(merge_biomart_res_all,merge_biomart_res_all$padj<0.05)
#write.csv(res_merged_cutoff,"Dasen_BR-Control_vs_TH-Control_CPM_padj0.05.csv")
###
up_down_1FC<-subset(res_merged_cutoff,res_merged_cutoff$log2FoldChange>1 | res_merged_cutoff$log2FoldChange< -1)
write.csv(up_down_1FC,file="Controls_updownFC1_padj0.05_June2015.csv")
#d<-up_down_1FC
d<-as.matrix(up_down_1FC[,c(2:7)])
rownames(d) <- up_down_1FC[,8]
d<-na.omit(d)
head(d)
colnames(d)
hr <- hclust(as.dist(1-cor(t(d), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.5))
clusterCols <- rainbow(length(unique(mycl)))
myClusterSideBar <- clusterCols[mycl]
myheatcol <- greenred(75)
#png("Cd_heatmap.png", width = 7*300,height = 7*300,res = 1200,pointsize = 2) 
heatmap.2(d, main="Brachial-Control vs. Thoracic-Control, padj<0.05, log2FC +-1", 
          Rowv=as.dendrogram(hr),
          cexRow=0.75,cexCol=0.8,srtCol= 90,
          adjCol = c(NA,0),offsetCol=2.5, 
          Colv=NA, dendrogram="row", 
          scale="row", col=myheatcol, 
          density.info="none", 
          trace="none", RowSideColors= myClusterSideBar)
###
up_1FC<-subset(res_merged_cutoff,res_merged_cutoff$log2FoldChange>1)
write.csv(up_1FC,file="Controls_upFC1_padj0.05_June2015.csv")
#d<-up_down_1FC
d<-as.matrix(up_1FC[,c(2:7)])
rownames(d) <- up_1FC[,8]
d<-na.omit(d)
head(d)
colnames(d)
hr <- hclust(as.dist(1-cor(t(d), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.5))
clusterCols <- rainbow(length(unique(mycl)))
myClusterSideBar <- clusterCols[mycl]
myheatcol <- greenred(75)
#png("Cd_heatmap.png", width = 7*300,height = 7*300,res = 1200,pointsize = 2) 
heatmap.2(d, main="Brachial-Control vs. Thoracic-Control, padj<0.05, log2FC>1", 
          Rowv=as.dendrogram(hr),
          cexRow=0.75,cexCol=0.8,srtCol= 90,
          adjCol = c(NA,0),offsetCol=2.5, 
          Colv=NA, dendrogram="row", 
          scale="row", col=myheatcol, 
          density.info="none", 
          trace="none", RowSideColors= myClusterSideBar)
###
down_1FC<-subset(res_merged_cutoff,res_merged_cutoff$log2FoldChange< -1)
write.csv(down_1FC,file="Controls_downFC1_padj0.05_June2015.csv")
#d<-up_down_1FC
d<-as.matrix(down_1FC[,c(2:7)])
rownames(d) <- down_1FC[,8]
d<-na.omit(d)
head(d)
colnames(d)
hr <- hclust(as.dist(1-cor(t(d), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.5))
clusterCols <- rainbow(length(unique(mycl)))
myClusterSideBar <- clusterCols[mycl]
myheatcol <- greenred(75)
#png("Cd_heatmap.png", width = 7*300,height = 7*300,res = 1200,pointsize = 2) 
heatmap.2(d, main="Brachial-Control vs. Thoracic-Control, padj<0.05, log2FC<-1", 
          Rowv=as.dendrogram(hr),
          cexRow=0.75,cexCol=0.8,srtCol= 90,
          adjCol = c(NA,0),offsetCol=2.5, 
          Colv=NA, dendrogram="row", 
          scale="row", col=myheatcol, 
          density.info="none", 
          trace="none", RowSideColors= myClusterSideBar)

