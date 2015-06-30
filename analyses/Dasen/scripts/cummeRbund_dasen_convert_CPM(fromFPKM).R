library(cummeRbund)
library(biomaRt)
setwd("~/Documents/Dasen/thoracic/Cuffdiff")
cuff<-readCufflinks()
cuff
# plotMDS
a<-genes(cuff)
dat<-repFpkmMatrix(a)
dat<-log10(dat+1)
dat.filt <- apply(dat,1,function(row) all(row!=0))
dat<-dat[dat.filt,]
d<-JSdist(makeprobs(dat))
fit <- cmdscale(d,eig=TRUE, k=2)
fit$points
replicates(cuff)
rownames(fit$points)<-c("TH-B-Mutant", "TH-C-Mutant", "TH-A-Mutant", "TH-B-Control", "TH-A-Control", "TH-C-Control")
fit$points
res<-data.frame(names=rownames(fit$points),M1=fit$points[,1],M2=fit$points[,2])
p <- ggplot(res)
p <- p + geom_point(aes(x=M1,y=M2,label=names,color=names)) + geom_text(aes(x=M1,y=M2,label=names,color=names)) + theme_bw()
p
#
# FPKM values as gene by replicate (repFpkmMatrix) matrix
gene.rep.matrix<-repFpkmMatrix(genes(cuff))
isoforms.rep.matrix<-repFpkmMatrix(isoforms(cuff))
dim(gene.rep.matrix)
dim(isoforms.rep.matrix)
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
###
# convert to CPM
# from normalized FPKM values
sum_FPKM_all<-colSums(gene.rep.matrix)
head(gene.rep.matrix)
CPM<-data.frame()
#for (i in 1:length(sum_FPKM_all))
#{
#  CPM<-cbind(data.frame(gene.rep.matrix[,i]/sum_FPKM_all[i]))  
#}
new_col1<-data.frame(gene.rep.matrix[,1]/sum_FPKM_all[1])*10^6
new_col2<-data.frame(gene.rep.matrix[,2]/sum_FPKM_all[2])*10^6
new_col3<-data.frame(gene.rep.matrix[,3]/sum_FPKM_all[3])*10^6
new_col4<-data.frame(gene.rep.matrix[,4]/sum_FPKM_all[4])*10^6
new_col5<-data.frame(gene.rep.matrix[,5]/sum_FPKM_all[5])*10^6
new_col6<-data.frame(gene.rep.matrix[,6]/sum_FPKM_all[6])*10^6
CPM<-cbind(new_col1,new_col2,new_col3,new_col4,new_col5,new_col6)
rownames(CPM)<-rownames(gene.rep.matrix)
colnames(gene.rep.matrix)
replicates(cuff)
colnames(CPM)<-c("TH-B-Mutant","TH-C-Mutant","TH-A-Mutant","TH-B-Control","TH-A-Control","TH-C-Control")
head(CPM)
baseMean<-rowMeans(CPM)
log2FC<-log2(rowMeans(CPM[,1:3])/rowMeans(CPM[,4:6]))
CPM_full<-cbind(CPM,baseMean,log2FC)


# MA plot
baseMean<-cbind(new_genes$value_1,new_genes$value_2)
baseMean<-rowMeans(baseMean)
plot(log2(baseMean), new_genes$log2.fold_change., col=ifelse(new_genes$q_value < 0.01, "red","gray77"),main="(tuxedo) Thoracic Mutant vs. Control (padj<0.05)",xlim=c(1,15),ylim=c(-5,5),pch=20,cex=1)
abline(h=c(-1,1), col="blue")
res_merged_cutoff<-subset(new_genes,new_genes$q_value<0.1)
