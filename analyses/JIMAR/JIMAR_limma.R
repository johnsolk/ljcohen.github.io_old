library(limma)
library("arrayQualityMetrics")
setwd("~/Documents/HBOI/JIMAR/JIMAR/microarray_limma_analysis")
raw_data<-read.csv("JIMAR_raw_data.csv")
data<-raw_data[,c(8:29)]
rownames(data)<-raw_data$RefNumber
data<-data[,c(17:22,1:16)]
sample_info<-read.csv("targets.csv")
rownames(sample_info)<-sample_info$X
sample_info<-sample_info[,-1]
col.names<-rownames(sample_info)
colnames(data)<-col.names
annotation<-read.csv("FeatAnnotFile_SEE_10-18-12.csv")
annotation<-annotation[order(rownames(annotation)),]
data<-data[order(rownames(data)),]
data[data<0]=0
data<-as.matrix(data)
pd<-new("AnnotatedDataFrame",data=sample_info)
an<-new("AnnotatedDataFrame",data=annotation)
experimentData<-new("MIAME",name="Sara Edge, Lisa Cohen",
                    lab="Marine Genomics, HBOI",
                    contact="ljcohen@ucdavis.edu",
                    title="JIMAR, Monitopora sp. HI tumor DZ vs. H and H-DZ",
                    abstract="ExpressionSet for Monitopora sp. Microarray Data",
                    other=list(notes="Extracted from raw data with GenePixPro software"))
JIMAR_ExpressionSet<-new("ExpressionSet",exprs=data,phenoData=pd,experimentData=experimentData,featureData=an)
arrayQualityMetrics(expressionset = JIMAR_ExpressionSet,outdir = "JIMAR_ArrayQualityMetrics_log2transform_raw_notnormalized_site",force = TRUE,intgroup = c("Site"),do.logtransform=TRUE)
