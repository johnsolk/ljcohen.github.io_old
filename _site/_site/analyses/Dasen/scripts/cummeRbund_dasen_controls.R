library(cummeRbund)
library(biomaRt)
setwd("~/Documents/Dasen/controls")
cuff<-readCufflinks()
cuff
#displays file and replicate names for cuff data set:
replicates(cuff)
# plotMDS
a<-genes(cuff)
dat<-repFpkmMatrix(a)
dat<-log10(dat+1)
dat.filt <- apply(dat,1,function(row) all(row!=0))
dat<-dat[dat.filt,]
d<-JSdist(makeprobs(dat))
fit <- cmdscale(d,eig=TRUE, k=2)
fit$points
rownames(fit$points)<-c("BR-C-Control", "BR-A-Control", "BR-B-Control", "TH-B-Control", "TH-A-Control", "TH-C-Control")
fit$points
res<-data.frame(names=rownames(fit$points),M1=fit$points[,1],M2=fit$points[,2])
p <- ggplot(res)
p <- p + geom_point(aes(x=M1,y=M2,label=names,color=names)) + geom_text(aes(x=M1,y=M2,label=names,color=names)) + theme_bw()
p
# MA plot
#mCount<-MAplot(genes(cuff),"ControlB","ControlT",pseudocount=1,logMode=TRUE,useCount=FALSE)
#mCount
plot(log2(res$baseMean), res$log2FoldChange, col=ifelse(res$padj < 0.05, "red","gray67"),main="Thoracic Mutant vs. Control (padj<0.05)",xlim=c(1,15),ylim=c(-2,2),pch=20,cex=1)
abline(h=c(-1,1), col="blue")
# FPKM values as gene by replicate (repFpkmMatrix) matrix
gene.rep.matrix<-repFpkmMatrix(genes(cuff))
isoforms.rep.matrix<-repFpkmMatrix(isoforms(cuff))
dim(gene.rep.matrix)
dim(isoforms.rep.matrix)
# remove all rows with any 0
dat.filt.genes <- apply(gene.rep.matrix,1,function(row) all(row!=0))
dat.filt.isoforms<-apply(isoforms.rep.matrix,1,function(row) all(row!=0))
gene.rep.matrix<-gene.rep.matrix[dat.filt.genes,]
isoforms.rep.matrix<-isoforms.rep.matrix[dat.filt.isoforms,]
dim(gene.rep.matrix)
dim(isoforms.rep.matrix)
# remove all rows with Sum less than 12
gene.rep.matrix<-gene.rep.matrix[rowSums(gene.rep.matrix)>12,]
dat.filt.isoforms<-isoforms.rep.matrix[rowSums(isoforms.rep.matrix)>12,]
dim(gene.rep.matrix)
dim(isoforms.rep.matrix)
head(gene.rep.matrix)
head(isoforms.rep.matrix)
#write.csv(gene.rep.matrix, file="genes-fpkm-matrix.csv")
#write.csv(gene.rep.matrix, file="isoforms-fpkm-matrix.csv")
orig_isoforms<-read.csv("isoform_exp.diff", sep="\t")
orig_genes<-read.csv("gene_exp.diff",sep="\t")
replicates(cuff)
customnames_2<-c("BR-C-Control", "BR-A-Control", "BR-B-Control", "TH-B-Control", "TH-A-Control", "TH-C-Control","test_id")
customnames<-c("BR-C-Control", "BR-A-Control", "BR-B-Control", "TH-B-Control", "TH-A-Control", "TH-C-Control")
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
head(new_genes)
head(new_isoforms)
write.csv(new_genes, file="genes-fpkm-matrix-replicates_controls.csv")
write.csv(new_isoforms, file="isoforms-fpkm-matrix-replicates_controls.csv")
baseMean<-cbind(new_genes$value_1,new_genes$value_2)
baseMean<-rowMeans(baseMean)
plot(log2(baseMean), new_genes$log2.fold_change., col=ifelse(new_genes$q_value < 0.01, "red","gray77"),main="(tuxedo) Brachial Control vs. Thoracic Control (padj<0.05)",xlim=c(1,15),ylim=c(-5,5),pch=20,cex=1)
abline(h=c(-1,1), col="blue")
