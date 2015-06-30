source('~/Documents/scripts/overLapper.R')
# Brachial Mutant vs. Control and Thoracic Mutant vs. Control
# First, import thoracic
setwd("~/Documents/Dasen/thoracic/Cuffdiff")
cuff<-readCufflinks()
cuff
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
#write.csv(gene.rep.matrix, file="genes-fpkm-matrix.csv")
#write.csv(gene.rep.matrix, file="isoforms-fpkm-matrix.csv")
orig_isoforms<-read.csv("isoform_exp.diff", sep="\t")
orig_genes<-read.csv("gene_exp.diff",sep="\t")
# check sample names:
# samples(cuff)
customnames_2<-c("TH-B-Mutant", "TH-C-Mutant", "TH-A-Mutant", "TH-B-Control", "TH-A-Control", "TH-C-Control","test_id")
customnames<-c("TH-B-Mutant", "TH-C-Mutant", "TH-A-Mutant", "TH-B-Control", "TH-A-Control", "TH-C-Control")
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
res1_thoracic<-subset(new_genes,new_genes$q_value<0.1)
# end of thoracic
# beginning of brachial
setwd("~/Documents/Dasen/brachial/cuffdiff_output_1")
cuff<-readCufflinks()
cuff
##
mySigMat<-sigMatrix(cuff,level='genes',alpha=0.05,)
genes.scv<-fpkmSCVPlot(genes(cuff))
isoforms.scv<-fpkmSCVPlot(isoforms(cuff))
# FPKM values as gene by replicate (repFpkmMatrix) matrix
gene.rep.matrix<-repFpkmMatrix(genes(cuff))
isoforms.rep.matrix<-repFpkmMatrix(isoforms(cuff))
head(gene.rep.matrix)
head(isoforms.rep.matrix)
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



head(new_genes)
res2_brachial<-subset(new_genes,new_genes$q_value<0.1)



##
## 2-way venn diagram

setlist <- list(Thoracic_Mutant_v_Control=as.vector(res1_thoracic$gene),Brachial_Mutant_v_Control=as.vector(res2_brachial$gene))
OLlist <- overLapper(setlist=setlist, sep="", type="vennsets")
counts <- sapply(OLlist$Venn_List, length)
vennPlot(counts=counts)
