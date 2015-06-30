source('~/Documents/scripts/overLapper.R')
# Brachial Mutant vs. Control and Thoracic Mutant vs. Control
# First, import thoracic
setwd("~/Documents/Dasen/thoracic/htseq_counts")
mypath<-"~/Documents/Dasen/thoracic/htseq_counts"
filenames<-list.files(path=mypath, pattern= "_counts.txt", full.names=FALSE)
datalist <-lapply(filenames, function(x){read.table(x,header=FALSE, sep="\t")})
for (i in 1:length(filenames))
{
  colnames(datalist[[i]])<-c("ID",filenames[[i]])
}
mergeddata <- Reduce(function(x,y) {merge(x,y, by="ID")}, datalist)
new_data_merge<-mergeddata[-1:-5,]
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
# get gene name from Ensembl gene ID
ensembl=useMart("ensembl")
ensembl = useDataset("mmusculus_gene_ensembl",mart=ensembl)
data_table<-data
ensembl_id<-rownames(data_table)
query<-getBM(attributes=c('ensembl_gene_id','external_gene_name','gene_biotype'), filters = 'ensembl_gene_id', values = ensembl_id, mart=ensembl)
new_res<-as.data.frame(data_table)
data_table<-cbind(new_res,ensembl_id)
col.names<-c("ensembl_id","external_gene_id","gene_biotype")
colnames(query)<-col.names
merge_biomart_res_counts <- merge(data_table,query,by="ensembl_id")
head(merge_biomart_res_counts)
temp_data_merged_counts<-merge_biomart_res_counts
head(temp_data_merged_counts)
res<-results(cds,contrast=c("condition","Mutant","Control"))
resultsNames(cds)
res_ordered<-res[order(res$padj),]
ensembl_id<-rownames(res_ordered)
res_ordered<-as.data.frame(res_ordered)
res_ordered<-cbind(res_ordered,ensembl_id)
head(res_ordered)
merge_biomart_res_counts <- merge(temp_data_merged_counts,res_ordered,by="ensembl_id")
merge_biomart_res_all<-subset(merge_biomart_res_counts,merge_biomart_res_counts$padj!="NA")
merge_biomart_res_all<-merge_biomart_res_all[order(merge_biomart_res_all$padj),]
head(merge_biomart_res_all)
res_merged_cutoff<-subset(merge_biomart_res_all,merge_biomart_res_all$padj<0.1)
head(res_merged_cutoff)
res1_thoracic<-res_merged_cutoff
# end of thoracic
# beginning of brachial
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
rown<-new_data_merge$ID
rownames(new_data_merge)<-rown
new_data_merge<-new_data_merge[,-1]
head(new_data_merge)
data<-new_data_merge
colnames(data)
col.names<-c("BR-A-Control","BR-A-Mutant","BR-B-Control","BR-B-Mutant","BR-C-Control","BR-C-Mutant")
colnames(data)<-col.names
colnames(data)
ExpDesign <- data.frame(row.names=colnames(data), condition = c("Control","Mutant","Control","Mutant","Control","Mutant"))
cds<-DESeqDataSetFromMatrix(countData=data, colData=ExpDesign,design=~condition)
cds$condition <- relevel(cds$condition, "Control")
cds<-DESeq(cds)
# get gene name from Ensembl gene ID
ensembl=useMart("ensembl")
ensembl = useDataset("mmusculus_gene_ensembl",mart=ensembl)
data_table<-data
ensembl_id<-rownames(data_table)
query<-getBM(attributes=c('ensembl_gene_id','external_gene_name','gene_biotype'), filters = 'ensembl_gene_id', values = ensembl_id, mart=ensembl)
new_res<-as.data.frame(data_table)
data_table<-cbind(new_res,ensembl_id)
col.names<-c("ensembl_id","external_gene_id","gene_biotype")
colnames(query)<-col.names
merge_biomart_res_counts <- merge(data_table,query,by="ensembl_id")
head(merge_biomart_res_counts)
temp_data_merged_counts<-merge_biomart_res_counts
head(temp_data_merged_counts)
##
res<-results(cds,contrast=c("condition","Mutant","Control"))
resultsNames(cds)
res_ordered<-res[order(res$padj),]
ensembl_id<-rownames(res_ordered)
res_ordered<-as.data.frame(res_ordered)
res_ordered<-cbind(res_ordered,ensembl_id)
head(res_ordered)
merge_biomart_res_counts <- merge(temp_data_merged_counts,res_ordered,by="ensembl_id")
merge_biomart_res_all<-subset(merge_biomart_res_counts,merge_biomart_res_counts$padj!="NA")
merge_biomart_res_all<-merge_biomart_res_all[order(merge_biomart_res_all$padj),]
res_merged_cutoff<-subset(merge_biomart_res_all,merge_biomart_res_all$padj<0.1)
head(res_merged_cutoff)
res2_brachial<-res_merged_cutoff



##
## 2-way venn diagram

setlist <- list(Thoracic_Mutant_v_Control=as.vector(res1_thoracic$external_gene_id),Brachial_Mutant_v_Control=as.vector(res2_brachial$external_gene_id))
OLlist <- overLapper(setlist=setlist, sep="", type="vennsets")
counts <- sapply(OLlist$Venn_List, length)
vennPlot(counts=counts)
