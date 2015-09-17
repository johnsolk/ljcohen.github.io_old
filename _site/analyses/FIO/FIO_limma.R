library(limma)
library("arrayQualityMetrics")
setwd("~/Documents/HBOI/FIO/FIO_limma_microarray")
sample_info<-read.csv("targets.csv")
Chip.Array<-paste(sample_info$Chip,"_",sample_info$Array)
Chip.Array<-gsub(" ","",new_rows)
rownames(sample_info)<-Chip.Array
sample_info<-cbind(Chip.Array,sample_info)
sample_info<-sample_info[,c(1,13,11,12,2:10,14:16)]
data1<-read.csv("FIO_rawdata_part1.csv")
data2<-read.csv("FIO_rawdata_part2.csv")
data1<-as.data.frame(data1[,c(7:254)])
data2<-as.data.frame(data2[,c(7:118)])
data<-merge(data1,data2,by="RefNumber")
row.names<-data$RefNumber
data<-data[,-1]
colnames(data)<-Chip.Array
data<-as.matrix(data)
rownames(data)<-row.names
data[data<0]=0
data<-data[order(rownames(data)),]
annotation<-read.csv("FeatAnnotFile_SEE_10-18-12.csv")
annotation<-annotation[order(rownames(annotation)),]
pd<-new("AnnotatedDataFrame",data=sample_info)
an<-new("AnnotatedDataFrame",data=annotation)
experimentData<-new("MIAME",name="Sara Edge, Lisa Cohen, Joshua Voss",
                    lab="Marine Genomics, HBOI",
                    contact="ljcohen@ucdavis.edu",
                    title="FIO, Orbicella faveolata BOD exposure at Mote 2011",
                    abstract="ExpressionSet for Orbicella faveolata Microarray Data",
                    other=list(notes="Extracted from raw data with GenePixPro software"))
FIO_ExpressionSet<-new("ExpressionSet",exprs=data,phenoData=pd,experimentData=experimentData,featureData=an)
arrayQualityMetrics(expressionset = FIO_ExpressionSet,outdir = "FIO_ArrayQualityMetrics_log2transform_raw_notnormalized_trt",intgroup=c("Trt"),force = TRUE,do.logtransform=TRUE)
