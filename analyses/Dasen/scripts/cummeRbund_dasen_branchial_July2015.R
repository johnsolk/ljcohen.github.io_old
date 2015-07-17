library(cummeRbund)
library(biomaRt)
setwd("~/Documents/NYUMC/Dasen/brachial/cuffdiff_output_1")
cuff<-readCufflinks()
cuff
##
# plotMDS
a<-genes(cuff)
dat<-repFpkmMatrix(a)
dat<-log10(dat+1)
dat.filt <- apply(dat,1,function(row) all(row!=0))
dat<-dat[dat.filt,]
d<-JSdist(makeprobs(dat))
fit <- cmdscale(d,eig=TRUE, k=2)
fit$points
rownames(fit$points)<-c("BR-C-Mutant", "BR-A-Mutant", "BR-B-Mutant", "BR-C-Control", "BR-B-Control", "BR-A-Control")
fit$points
res<-data.frame(names=rownames(fit$points),M1=fit$points[,1],M2=fit$points[,2])
p <- ggplot(res)
p <- p + geom_point(aes(x=M1,y=M2,label=names,color=names)) + geom_text(aes(x=M1,y=M2,label=names,color=names)) + theme_bw()
p

###
mySigMat<-sigMatrix(cuff,level='genes',alpha=0.05,)
genes.scv<-fpkmSCVPlot(genes(cuff))
isoforms.scv<-fpkmSCVPlot(isoforms(cuff))
# FPKM values as gene by replicate (repFpkmMatrix) matrix
gene.rep.matrix<-repFpkmMatrix(genes(cuff))
isoforms.rep.matrix<-repFpkmMatrix(isoforms(cuff))
head(gene.rep.matrix)
head(isoforms.rep.matrix)
#write.csv(gene.rep.matrix, file="genes-fpkm-matrix.csv")
#write.csv(gene.rep.matrix, file="isoforms-fpkm-matrix.csv")
orig_isoforms<-read.csv("isoform_exp.diff", sep="\t")
orig_genes<-read.csv("gene_exp.diff",sep="\t")
customnames_2<- c("BR-C-Mutant", "BR-A-Mutant", "BR-B-Mutant", "BR-C-Control", "BR-B-Control", "BR-A-Control","test_id")
customnames<-c("BR-C-Mutant", "BR-A-Mutant", "BR-B-Mutant", "BR-C-Control", "BR-B-Control", "BR-A-Control")
new_col_isoforms<-rownames(isoforms.rep.matrix)
new_col_genes<-rownames(gene.rep.matrix)
colnames(isoforms.rep.matrix)<-customnames
colnames(gene.rep.matrix)<-customnames
new_isoforms.rep.matrix<-cbind(isoforms.rep.matrix,new_col_isoforms)
new_gene.rep.matrix<-cbind(gene.rep.matrix,new_col_genes)
colnames(new_isoforms.rep.matrix)<-customnames_2
colnames(new_gene.rep.matrix)<-customnames_2
new_isoforms<-merge(new_isoforms.rep.matrix,orig_isoforms,by="test_id")
new_genes<-merge(new_gene.rep.matrix,orig_genes,by="test_id")
dim(new_genes)
new_genes_filtered<-subset(new_genes,rowSums(new_genes[,c(2:7)])>1)
dim(new_genes_filtered)
new_genes_padj<-subset(new_genes_filtered,new_genes$q_value<0.05)
dim(new_genes_padj)
new_genes_log2FCcutoff<-subset(new_genes_padj,new_genes_padj$log2.fold_change>1 | new_genes_padj$log2.fold_change< -1)
dim(new_genes_log2FCcutoff)

write.csv(new_genes, file="genes-fpkm-matrix-replicates.csv")
write.csv(new_isoforms, file="isoforms-fpkm-matrix-replicates.csv")