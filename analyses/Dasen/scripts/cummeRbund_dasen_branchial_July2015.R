library(cummeRbund)
library(biomaRt)
library(gplots)
library(RColorBrewer)
library(biomaRt)
library("genefilter")
library("lattice")
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
new_genes_padj<-subset(new_genes,new_genes$q_value<0.05)
dim(new_genes_padj)
new_genes_log2FCcutoff<-subset(new_genes_padj,new_genes_padj$log2.fold_change>1 | new_genes_padj$log2.fold_change< -1)
new_genes_log2FCcutoff_genenames<-subset(new_genes_log2FCcutoff,new_genes_log2FCcutoff$gene!="-")
dim(new_genes_log2FCcutoff_genenames)
head(new_genes_log2FCcutoff_genenames)
#
head(gene.rep.matrix)
gene.rep.matrix.filtered<-subset(gene.rep.matrix,rowSums(gene.rep.matrix[,])>1)
mean.gene.rep.matrix<-rowMeans(gene.rep.matrix.filtered)
length(mean.gene.rep.matrix)
gene.rep.matrix.filtered<-cbind(gene.rep.matrix.filtered,mean.gene.rep.matrix)
head(gene.rep.matrix.filtered)
gene.rep.matrix.filtered<-cbind(gene.rep.matrix.filtered,rownames(gene.rep.matrix.filtered))
colnames(gene.rep.matrix.filtered)<-c("BR-C-Mutant","BR-A-Mutant","BR-B-Mutant","BR-C-Control","BR-B-Control","BR-A-Control","mean.gene.rep.matrix","gene_id")
gene.rep.matrix.filtered_merge<-merge(gene.rep.matrix.filtered,new_genes[,c(8,16,19)],by="gene_id")
head(gene.rep.matrix.filtered_merge)
plot(gene.rep.matrix.filtered_merge$mean.gene.rep.matrix, gene.rep.matrix.filtered_merge$log2.fold_change.,col=ifelse(gene.rep.matrix.filtered_merge$q_value < 0.05, "red","gray67"),main="(tuxedo) Brachial Control vs. Thoracic Control",xlim=c(1,50),ylim=c(-50,50),pch=20,cex=1)
abline(h=c(-1,1), col="blue")

# heatmap
d<-as.matrix(new_genes_log2FCcutoff_genenames[,c(2:7)])
rownames(d) <- new_genes_log2FCcutoff_genenames[,9]
hr <- hclust(as.dist(1-cor(t(d), method="pearson")), method="complete")
mycl <- cutree(hr, h=max(hr$height/1.5))
clusterCols <- rainbow(length(unique(mycl)))
#myClusterSideBar <- clusterCols[mycl]
myheatcol <- greenred(75)
heatmap.2(d, main="(tuxedo) Brachial q_value<0.05, log2FC>1 | log2FC< -1", 
          Rowv=as.dendrogram(hr),
          cexRow=1,cexCol=0.8,srtCol= 90,
          adjCol = c(NA,0),offsetCol=2.5, 
          Colv=NA, dendrogram="row", 
          scale="row", col=myheatcol, 
          density.info="none", 
          trace="none")

#write.csv(new_genes, file="genes-fpkm-matrix-replicates.csv")
#write.csv(new_isoforms, file="isoforms-fpkm-matrix-replicates.csv")