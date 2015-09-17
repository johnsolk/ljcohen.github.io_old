library(DESeq2)
library(biomaRt)
source('~/Documents/scripts/plotPCAWithSampleNames.R')
setwd("~/Documents/Dasen/brachial/htseq_counts")
mypath<-"~/Documents/Dasen/brachial/htseq_counts"
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
col.names<-c("TH-A-Control","TH-A-Mutant","TH-B-Control","TH-B-Mutant","TH-C-Control","TH-C-Mutant")
colnames(data)<-col.names
colnames(data)
ExpDesign <- data.frame(row.names=colnames(data), condition = c("Control","Mutant","Control","Mutant","Control","Mutant"))
cds<-DESeqDataSetFromMatrix(countData=data, colData=ExpDesign,design=~condition)
cds$condition <- relevel(cds$condition, "Control")
cds<-DESeq(cds)
# log2 transformation for PCA plot
log_cds<-rlog(cds)
plotPCAWithSampleNames(log_cds,intgroup="condition",ntop=40000)
###
# get gene name from Ensembl gene ID
ensembl=useMart("ensembl")
ensembl = useDataset("mmusculus_gene_ensembl",mart=ensembl)
data_table<-data
ensembl_id<-rownames(data_table)
query<-getBM(attributes=c('ensembl_gene_id','external_gene_name','gene_biotype'), filters = 'ensembl_gene_id', values = ensembl_id, mart=ensembl)
new_res<-as.data.frame(data_table)
data_table<-cbind(new_res,ensembl_id)
#col.names<-c("ensembl_id","external_gene_id","gene_biotype","name_1006")
col.names<-c("ensembl_id","external_gene_id","gene_biotype")
colnames(query)<-col.names
merge_biomart_res_counts <- merge(data_table,query,by="ensembl_id")
head(merge_biomart_res_counts)
temp_data_merged_counts<-merge_biomart_res_counts
#write.csv(temp_data_merged_counts,"Dasen_replicate_counts.csv")
head(temp_data_merged_counts)
##
res<-results(cds,contrast=c("condition","Mutant","Control"))
resultsNames(cds)
### generate MA plots
#plotMA(res2,alpha=0.01,main="Tfh, DKO vs. WT",ylim=c(-6,7))
plot(log2(res$baseMean), res$log2FoldChange, col=ifelse(res$padj < 0.05, "red","gray67"),main="(DESeq2) Brachial Mutant vs. Control (padj<0.05)",xlim=c(1,15),pch=20,cex=1)
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
write.csv(merge_biomart_res_all,"Dasen_Thoracid_Mutant_vs_Control_CPM_all.csv")
res_merged_cutoff<-subset(merge_biomart_res_all,merge_biomart_res_all$padj<0.01)
write.csv(merge_biomart_res_all,"Park_KO_vs_WT_norm_counts_DE_expression.csv")
###
