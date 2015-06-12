library("limma")
library("gplots")
library("arrayQualityMetrics")
library("Biobase")
library("ggplot2")
setwd("~/Documents/HBOI/SLR/SLR/SLR_2012_2013_rawdata_Rscriptsandanalyses")
#first chip name, array 4 image
chip1_4<-"63600_2013-05-24_250_array4.gpr"
#reads chip
chip1_4alldata<-readGAL(chip1_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
#takes only data from array 4
chip1_array4_alldata<-subset(chip1_4alldata,Array..==4)
chip1_array1_alldata<-subset(chip1_4alldata,Array..==1)
#first column is Name of feature
names<-data.frame(chip1_array1_alldata$Name)
colnames(names)<-"Name"
#in the future, you might want to know what Row and Column data come from
#for now, column and row are unnecessary because
#assume that all data will be in the same order
#and feature name will be the same for all arrays,  
#mydata<-data.frame(chip_data$Row,chip_data$Column,chip_data$Name)
#
#takes data Median feature intensity at 635 nm - Background intensity at 635 nm 
chip1_array4_data<-data.frame(chip1_array4_alldata$F635.Median...B635)
colnames(chip1_array4_data)<-"1_4"
all_data<-cbind(names,chip1_array4_data)
#chip 1 name, array3 image
chip1_3<-"63600_2013-05-24_300_array3.gpr"
chip1_3alldata<-readGAL(chip1_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip1_array3_alldata<-subset(chip1_3alldata,Array..==3)
chip1_array3_data<-data.frame(chip1_array3_alldata$F635.Median...B635)
colnames(chip1_array3_data)<-"1_3"
all_data<-cbind(all_data,chip1_array3_data)
chip1_2<-"63600_2013-05-24_370_arrays1,2.gpr"
chip1_2alldata<-readGAL(chip1_2,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip1_array2_alldata<-subset(chip1_2alldata,Array..==2)
chip1_array2_data<-data.frame(chip1_array2_alldata$F635.Median...B635)
colnames(chip1_array2_data)<-"1_2"
all_data<-cbind(all_data,chip1_array2_data)
chip1_1<-"63600_2013-05-24_300_array1.gpr"
chip1_1alldata<-readGAL(chip1_1,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip1_array1_alldata<-subset(chip1_1alldata,Array..==1)
chip1_array1_data<-data.frame(chip1_array1_alldata$F635.Median...B635)
colnames(chip1_array1_data)<-"1_1"
all_data<-cbind(all_data,chip1_array1_data)
chip2_4<-"63600_2013-12-05_0220_array4.gpr"
chip_alldata<-readGAL(chip2_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip2_array4_alldata<-subset(chip_alldata,Array..==4)
chip2_array4_data<-data.frame(chip2_array4_alldata$F635.Median...B635)
colnames(chip2_array4_data)<-"2_4"
all_data<-cbind(all_data,chip2_array4_data)
chip2_3<-"63600_2013-12-05_0220_array3.gpr"
chip2_3alldata<-readGAL(chip2_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip2_array3_alldata<-subset(chip2_3alldata,Array..==3)
chip2_array3_data<-data.frame(chip2_array3_alldata$F635.Median...B635)
colnames(chip2_array3_data)<-"2_3"
all_data<-cbind(all_data,chip2_array3_data)
chip2_2<-"63600_2013-12-05_0260_array2.gpr"
chip2_2alldata<-readGAL(chip2_2,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip2_array2_alldata<-subset(chip2_2alldata,Array..==2)
chip2_array2_data<-data.frame(chip2_array2_alldata$F635.Median...B635)
colnames(chip2_array2_data)<-"2_2"
all_data<-cbind(all_data,chip2_array2_data)
chip2_1<-"63600_2013-12-05_0300_arrays1,2.gpr"
chip2_1alldata<-readGAL(chip2_1,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip2_array1_alldata<-subset(chip2_1alldata,Array..==1)
chip2_array1_data<-data.frame(chip2_array1_alldata$F635.Median...B635)
colnames(chip2_array1_data)<-"2_1"
all_data<-cbind(all_data,chip2_array1_data)
chip3_4<-"63601_2013-06-06_0240_array4.gpr"
chip3_4alldata<-readGAL(chip3_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip3_array4alldata<-subset(chip3_4alldata,Array..==4)
chip3_array4data<-data.frame(chip3_array4alldata$F635.Median...B635)
colnames(chip3_array4data)<-"3_4"
all_data<-cbind(all_data,chip3_array4data)
chip3_arrays123<-"63601_2013-06-06_300_arrays1,2,3.gpr"
chip3_arrays123alldata<-readGAL(chip3_arrays123,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip3_array3_alldata<-subset(chip3_arrays123alldata,Array..==3)
chip3_array3data<-data.frame(chip3_array3_alldata$F635.Median...B635)
colnames(chip3_array3data)<-"3_3"
all_data<-cbind(all_data,chip3_array3data)
chip3_array2_alldata<-subset(chip3_arrays123alldata,Array..==2)
chip3_array2_data<-data.frame(chip3_array2_alldata$F635.Median...B635)
colnames(chip3_array2_data)<-"3_2"
all_data<-cbind(all_data,chip3_array2_data)
chip3_array1_alldata<-subset(chip3_arrays123alldata,Array..==1)
chip3_array1_data<-data.frame(chip3_array1_alldata$F635.Median...B635)
colnames(chip3_array1_data)<-"3_1"
all_data<-cbind(all_data,chip3_array1_data)
chip4_4<-"63605_2013-06-11_array4.gpr"
chip4_4alldata<-readGAL(chip4_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip4_array4alldata<-subset(chip4_4alldata,Array..==4)
chip4_array4data<-data.frame(chip4_array4alldata$F635.Median...B635)
colnames(chip4_array4data)<-"4_4"
all_data<-cbind(all_data,chip4_array4data)
chip4_3<-"63605_2013-06-11_array3.gpr"
chip4_array3alldata<-readGAL(chip4_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip4_array3_alldata<-subset(chip4_array3alldata,Array..==3)
chip4_array3data<-data.frame(chip4_array3_alldata$F635.Median...B635)
colnames(chip4_array3data)<-"4_3"
all_data<-cbind(all_data,chip4_array3data)
chip4_arrays12<-"63605_2013-06-11_300_arrays1,2.gpr"
chip4_arrays12alldata<-readGAL(chip4_arrays12,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip4_array2_alldata<-subset(chip4_arrays12alldata,Array..==2)
chip4_array2_data<-data.frame(chip4_array2_alldata$F635.Median...B635)
colnames(chip4_array2_data)<-"4_2"
all_data<-cbind(all_data,chip4_array2_data)
chip4_array1_alldata<-subset(chip4_arrays12alldata,Array..==1)
chip4_array1_data<-data.frame(chip4_array1_alldata$F635.Median...B635)
colnames(chip4_array1_data)<-"4_1"
all_data<-cbind(all_data,chip4_array1_data)
chip5_4<-"63606_2013-06-11_240_array4.gpr"
chip5_4alldata<-readGAL(chip5_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip5_array4alldata<-subset(chip5_4alldata,Array..==4)
chip5_array4data<-data.frame(chip5_array4alldata$F635.Median...B635)
colnames(chip5_array4data)<-"5_4"
all_data<-cbind(all_data,chip5_array4data)
chip5_3<-"63606_2013-06-11_0270_array3.gpr"
chip5_array3alldata<-readGAL(chip5_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip5_array3_alldata<-subset(chip5_array3alldata,Array..==3)
chip5_array3data<-data.frame(chip5_array3_alldata$F635.Median...B635)
colnames(chip5_array3data)<-"5_3"
all_data<-cbind(all_data,chip5_array3data)
chip5_arrays12<-"63606_2013-06-11_300_arrays1,2.gpr"
chip5_arrays12alldata<-readGAL(chip5_arrays12,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip5_array2_alldata<-subset(chip5_arrays12alldata,Array..==2)
chip5_array2_data<-data.frame(chip5_array2_alldata$F635.Median...B635)
colnames(chip5_array2_data)<-"5_2"
all_data<-cbind(all_data,chip5_array2_data)
chip5_array1_alldata<-subset(chip5_arrays12alldata,Array..==1)
chip5_array1_data<-data.frame(chip5_array1_alldata$F635.Median...B635)
colnames(chip5_array1_data)<-"5_1"
all_data<-cbind(all_data,chip5_array1_data)
chip6_4<-"63608_2013-12-05_0270_array4.gpr"
chip6_4alldata<-readGAL(chip6_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip6_array4alldata<-subset(chip6_4alldata,Array..==4)
chip6_array4data<-data.frame(chip6_array4alldata$F635.Median...B635)
colnames(chip6_array4data)<-"6_4"
all_data<-cbind(all_data,chip6_array4data)
chip6_3<-"63608_2013-12-05_0270_array3.gpr"
chip6_array3alldata<-readGAL(chip6_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip6_array3_alldata<-subset(chip6_array3alldata,Array..==3)
chip6_array3data<-data.frame(chip6_array3_alldata$F635.Median...B635)
colnames(chip6_array3data)<-"6_3"
all_data<-cbind(all_data,chip6_array3data)
chip6_arrays12<-"63608_2013-12-05_0280_arrays1,2.gpr"
chip6_arrays12alldata<-readGAL(chip6_arrays12,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip6_array2_alldata<-subset(chip6_arrays12alldata,Array..==2)
chip6_array2_data<-data.frame(chip6_array2_alldata$F635.Median...B635)
colnames(chip6_array2_data)<-"6_2"
all_data<-cbind(all_data,chip6_array2_data)
chip6_array1_alldata<-subset(chip6_arrays12alldata,Array..==1)
chip6_array1_data<-data.frame(chip6_array1_alldata$F635.Median...B635)
colnames(chip6_array1_data)<-"6_1"
all_data<-cbind(all_data,chip6_array1_data)
chip7_4<-"63710_2013-05-24_array4.gpr"
chip7_4alldata<-readGAL(chip7_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip7_array4alldata<-subset(chip7_4alldata,Array..==4)
chip7_array4data<-data.frame(chip7_array4alldata$F635.Median...B635)
colnames(chip7_array4data)<-"7_4"
all_data<-cbind(all_data,chip7_array4data)
chip7_3<-"63710_2013-05-24_300_array3.gpr"
chip7_array3alldata<-readGAL(chip7_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip7_array3_alldata<-subset(chip7_array3alldata,Array..==3)
chip7_array3data<-data.frame(chip7_array3_alldata$F635.Median...B635)
colnames(chip7_array3data)<-"7_3"
all_data<-cbind(all_data,chip7_array3data)
chip7_arrays12<-"63710_2013-05-24_350_arrays1,2.gpr"
chip7_arrays12alldata<-readGAL(chip7_arrays12,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip7_array2_alldata<-subset(chip7_arrays12alldata,Array..==2)
chip7_array2_data<-data.frame(chip7_array2_alldata$F635.Median...B635)
colnames(chip7_array2_data)<-"7_2"
all_data<-cbind(all_data,chip7_array2_data)
chip7_array1_alldata<-subset(chip7_arrays12alldata,Array..==1)
chip7_array1_data<-data.frame(chip7_array1_alldata$F635.Median...B635)
colnames(chip7_array1_data)<-"7_1"
all_data<-cbind(all_data,chip7_array1_data)
chip8_4<-"63768_2013-05-30_230_array4.gpr"
chip8_4alldata<-readGAL(chip8_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip8_array4alldata<-subset(chip8_4alldata,Array..==4)
chip8_array4data<-data.frame(chip8_array4alldata$F635.Median...B635)
colnames(chip8_array4data)<-"8_4"
all_data<-cbind(all_data,chip8_array4data)
chip8_3<-"63768_2013-05-30_250_array3.gpr"
chip8_array3alldata<-readGAL(chip8_3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip8_array3_alldata<-subset(chip8_array3alldata,Array..==3)
chip8_array3data<-data.frame(chip8_array3_alldata$F635.Median...B635)
colnames(chip8_array3data)<-"8_3"
all_data<-cbind(all_data,chip8_array3data)
chip8_arrays12<-"63768_2013-05-30_300_arrays1,2.gpr"
chip8_arrays12alldata<-readGAL(chip8_arrays12,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip8_array2_alldata<-subset(chip8_arrays12alldata,Array..==2)
chip8_array2_data<-data.frame(chip8_array2_alldata$F635.Median...B635)
colnames(chip8_array2_data)<-"8_2"
all_data<-cbind(all_data,chip8_array2_data)
chip8_array1_alldata<-subset(chip8_arrays12alldata,Array..==1)
chip8_array1_data<-data.frame(chip8_array1_alldata$F635.Median...B635)
colnames(chip8_array1_data)<-"8_1"
all_data<-cbind(all_data,chip8_array1_data)
chip9_arrays34<-"63769_2013-05-30_230_arrays3,4.gpr"
chip9_arrays34alldata<-readGAL(chip9_arrays34,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip9_array4_alldata<-subset(chip9_arrays34alldata,Array..==4)
chip9_array4_data<-data.frame(chip9_array4_alldata$F635.Median...B635)
colnames(chip9_array4_data)<-"9_4"
all_data<-cbind(all_data,chip9_array4_data)
chip9_array3_alldata<-subset(chip9_arrays34alldata,Array..==3)
chip9_array3_data<-data.frame(chip9_array3_alldata$F635.Median...B635)
colnames(chip9_array3_data)<-"9_3"
all_data<-cbind(all_data,chip9_array3_data)
chip9_arrays12<-"63769_2013-05-30_300_arrays1,2.gpr"
chip9_arrays12alldata<-readGAL(chip9_arrays12,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip9_array2_alldata<-subset(chip9_arrays12alldata,Array..==2)
chip9_array2_data<-data.frame(chip9_array2_alldata$F635.Median...B635)
colnames(chip9_array2_data)<-"9_2"
all_data<-cbind(all_data,chip9_array2_data)
chip9_array1_alldata<-subset(chip9_arrays12alldata,Array..==1)
chip9_array1_data<-data.frame(chip9_array1_alldata$F635.Median...B635)
colnames(chip9_array1_data)<-"9_1"
all_data<-cbind(all_data,chip9_array1_data)
chip10_all<-"63770_2013-06-05_0220_all.gpr"
chip10_arrays1234alldata<-readGAL(chip10_all,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip10_array4_alldata<-subset(chip10_arrays1234alldata,Array..==4)
chip10_array4_data<-data.frame(chip10_array4_alldata$F635.Median...B635)
colnames(chip10_array4_data)<-"10_4"
all_data<-cbind(all_data,chip10_array4_data)
chip10_array3_alldata<-subset(chip10_arrays1234alldata,Array..==3)
chip10_array3_data<-data.frame(chip10_array3_alldata$F635.Median...B635)
colnames(chip10_array3_data)<-"10_3"
all_data<-cbind(all_data,chip10_array3_data)
chip10_array2_alldata<-subset(chip10_arrays1234alldata,Array..==2)
chip10_array2_data<-data.frame(chip10_array2_alldata$F635.Median...B635)
colnames(chip10_array2_data)<-"10_2"
all_data<-cbind(all_data,chip10_array2_data)
chip10_array1_alldata<-subset(chip10_arrays1234alldata,Array..==1)
chip10_array1_data<-data.frame(chip10_array1_alldata$F635.Median...B635)
colnames(chip10_array1_data)<-"10_1"
all_data<-cbind(all_data,chip10_array1_data)
chip11_4<-"63771_2013-06-06_220_array4.gpr"
chip11_4alldata<-readGAL(chip11_4,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip11_array4alldata<-subset(chip11_4alldata,Array..==4)
chip11_array4data<-data.frame(chip11_array4alldata$F635.Median...B635)
colnames(chip11_array4data)<-"11_4"
all_data<-cbind(all_data,chip11_array4data)
chip11_arrays123<-"63771_2013-06-06_0250_arrays1,2,3.gpr"
chip11_arrays123alldata<-readGAL(chip11_arrays123,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip11_array3_alldata<-subset(chip11_arrays123alldata,Array..==3)
chip11_array3data<-data.frame(chip11_array3_alldata$F635.Median...B635)
colnames(chip11_array3data)<-"11_3"
all_data<-cbind(all_data,chip11_array3data)
chip11_array2_alldata<-subset(chip11_arrays123alldata,Array..==2)
chip11_array2_data<-data.frame(chip11_array2_alldata$F635.Median...B635)
colnames(chip11_array2_data)<-"11_2"
all_data<-cbind(all_data,chip11_array2_data)
chip11_array1_alldata<-subset(chip11_arrays123alldata,Array..==1)
chip11_array1_data<-data.frame(chip11_array1_alldata$F635.Median...B635)
colnames(chip11_array1_data)<-"11_1"
all_data<-cbind(all_data,chip11_array1_data)
head(all_data)
# data from 2010:
# chip 12
chip12_arrays1234<-"4020312_2011-04-08_0400.gpr"
chip12_arrays1234alldata<-readGAL(chip12_arrays1234,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip12_array4_alldata<-subset(chip12_arrays1234alldata,Array..==4)
chip12_array4data<-data.frame(chip12_array4_alldata$F532.Median...B532)
colnames(chip12_array4data)<-"12_4"
all_data<-cbind(all_data,chip12_array4data)
chip12_array3_alldata<-subset(chip12_arrays1234alldata,Array..==3)
chip12_array3data<-data.frame(chip12_array3_alldata$F532.Median...B532)
colnames(chip12_array3data)<-"12_3"
all_data<-cbind(all_data,chip12_array3data)
chip12_array2_alldata<-subset(chip12_arrays1234alldata,Array..==2)
chip12_array2_data<-data.frame(chip12_array2_alldata$F532.Median...B532)
colnames(chip12_array2_data)<-"12_2"
all_data<-cbind(all_data,chip12_array2_data)
chip12_array1_alldata<-subset(chip12_arrays1234alldata,Array..==1)
chip12_array1_data<-data.frame(chip12_array1_alldata$F532.Median...B532)
colnames(chip12_array1_data)<-"12_1"
all_data<-cbind(all_data,chip12_array1_data)
# chip 13
chip13_arrays1234<-"4020385_2011-03-31_0400.gpr"
chip13_arrays1234alldata<-readGAL(chip13_arrays1234,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip13_array4_alldata<-subset(chip13_arrays1234alldata,Array..==4)
chip13_array4data<-data.frame(chip13_array4_alldata$F532.Median...B532)
colnames(chip13_array4data)<-"13_4"
all_data<-cbind(all_data,chip13_array4data)
chip13_array3_alldata<-subset(chip13_arrays1234alldata,Array..==3)
chip13_array3data<-data.frame(chip13_array3_alldata$F532.Median...B532)
colnames(chip13_array3data)<-"13_3"
all_data<-cbind(all_data,chip13_array3data)
chip13_array2_alldata<-subset(chip13_arrays1234alldata,Array..==2)
chip13_array2_data<-data.frame(chip13_array2_alldata$F532.Median...B532)
colnames(chip13_array2_data)<-"13_2"
all_data<-cbind(all_data,chip13_array2_data)
chip13_array1_alldata<-subset(chip13_arrays1234alldata,Array..==1)
chip13_array1_data<-data.frame(chip13_array1_alldata$F532.Median...B532)
colnames(chip13_array1_data)<-"13_1"
all_data<-cbind(all_data,chip13_array1_data)

# chip 14
chip14_arrays123<-"4020412_2011-04-07_0400.gpr"
chip14_arrays123alldata<-readGAL(chip14_arrays123,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip14_array3_alldata<-subset(chip14_arrays123alldata,Array..==3)
chip14_array3data<-data.frame(chip14_array3_alldata$F532.Median...B532)
colnames(chip14_array3data)<-"14_3"
all_data<-cbind(all_data,chip14_array3data)
chip14_array2_alldata<-subset(chip14_arrays123alldata,Array..==2)
chip14_array2_data<-data.frame(chip14_array2_alldata$F532.Median...B532)
colnames(chip14_array2_data)<-"14_2"
all_data<-cbind(all_data,chip14_array2_data)
chip14_array1_alldata<-subset(chip14_arrays123alldata,Array..==1)
chip14_array1_data<-data.frame(chip14_array1_alldata$F532.Median...B532)
colnames(chip14_array1_data)<-"14_1"
all_data<-cbind(all_data,chip14_array1_data)

# chip 15

chip15_array3<-"4020412_2011-04-08_0400.gpr"
chip15_array3alldata<-readGAL(chip15_array3,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip15_array3_alldata<-subset(chip15_array3alldata,Array..==3)
chip15_array3data<-data.frame(chip15_array3_alldata$F532.Median...B532)
colnames(chip15_array3data)<-"15_3"
all_data<-cbind(all_data,chip15_array3data)


# chip 16

chip16_arrays1234<-"4020509_2011-03-31_0400.gpr"
chip16_arrays1234alldata<-readGAL(chip16_arrays1234,path=NULL,header=TRUE,sep="\t",quote="\"",skip=NULL,as.is=TRUE)
chip16_array4_alldata<-subset(chip16_arrays1234alldata,Array..==4)
chip16_array4data<-data.frame(chip16_array4_alldata$F532.Median...B532)
colnames(chip16_array4data)<-"16_4"
all_data<-cbind(all_data,chip16_array4data)
chip16_array3_alldata<-subset(chip16_arrays1234alldata,Array..==3)
chip16_array3data<-data.frame(chip16_array3_alldata$F532.Median...B532)
colnames(chip16_array3data)<-"16_3"
all_data<-cbind(all_data,chip16_array3data)
chip16_array2_alldata<-subset(chip16_arrays1234alldata,Array..==2)
chip16_array2_data<-data.frame(chip16_array2_alldata$F532.Median...B532)
colnames(chip16_array2_data)<-"16_2"
all_data<-cbind(all_data,chip16_array2_data)
chip16_array1_alldata<-subset(chip16_arrays1234alldata,Array..==1)
chip16_array1_data<-data.frame(chip16_array1_alldata$F532.Median...B532)
colnames(chip16_array1_data)<-"16_1"
all_data<-cbind(all_data,chip16_array1_data)


head(all_data)
#Once the data frame "all_data" is built
#It has to be converted to matrix
#Then all neg values changed to 0
#Then whole matrix shift +1
#for purposes of log2 transform
all_data_nonames<-all_data[,-1]
matrix_alldata<-as.matrix(all_data_nonames)
head(matrix_alldata)
matrix_alldata[matrix_alldata<0]<-0
head(matrix_alldata)
SLR_matrix_shift1<-matrix_alldata+1
nams<-all_data$Name
rownames(SLR_matrix_shift1)=make.names(nams,unique=TRUE)
head(SLR_matrix_shift1)
SLR_matrix_shift1_log2<-log2(SLR_matrix_shift1)
norm_SLR_matrix_shift1_log2<-normalizeBetweenArrays(SLR_matrix_shift1_log2)
SLR_matrix_shift1_log2_Loess<-normalizeCyclicLoess(SLR_matrix_shift1_log2)

## PCA 
# chip
library(lattice)
x<-SLR_matrix_shift1_log2_Loess
pca = prcomp(t(x))
names = colnames(x)
fac= factor(c("1","1","1","1","2","2","2","2","3","3","3","3","4","4","4","4","5","5","5","5","6","6","6","6","7","7","7","7","8","8","8","8",
              "9","9","9","9","10","10","10","10","11","11","11","11","12","12","12","12"))
fac
colours = c("red","blue","green","yellow","orange","purple","black","brown","gray","lightblue","deeppink")
xyplot(
  PC2 ~ PC1, groups=fac, data=as.data.frame(pca$x), pch=16, cex=2,
  panel=function(x, y, ...) {
    panel.xyplot(x, y, ...);
    ltext(x=x, y=y, labels=names, pos=1, offset=0.8, cex=1)
  },
  aspect = "fill", col=colours,
  #main = draw.key(key = list(rect = list(col = list(col=colours), text = list(levels(fac)), rep = FALSE)))
)

###
# hyb date

fac= factor(c("5/24/13","5/24/13","5/24/13","5/24/13",
              "12/5/13","12/5/13","12/5/13","12/5/13",
              "6/6/13","6/6/13","6/6/13","6/6/13",
              "6/11/13","6/11/13","6/11/13","6/11/13",
              "6/11/13","6/11/13","6/11/13","6/11/13",
              "12/5/13","12/5/13","12/5/13","12/5/13",
              "5/24/13","5/24/13","5/24/13","5/24/13",
              "5/30/13","5/30/13","5/30/13","5/30/13",
              "5/30/13","5/30/13","5/30/13","5/30/13",
              "6/5/13","6/5/13","6/5/13","6/5/13",
              "6/6/13","6/6/13","6/6/13","6/6/13"))
names=fac
colours = c("red","blue","green","yellow","orange","purple","black","brown")
xyplot(
  PC2 ~ PC1, groups=fac, data=as.data.frame(pca$x), pch=16, cex=2,
  panel=function(x, y, ...) {
    panel.xyplot(x, y, ...);
    ltext(x=x, y=y, labels=names, pos=1, offset=0.8, cex=1)
  },
  aspect = "fill", col=colours,
  #main = draw.key(key = list(rect = list(col = list(col=colours), text = list(levels(fac)), rep = FALSE)))
)

###

# site

fac= factor(c("South","Ledge","South","Ledge",
              "Central","South","Ledge","Ledge",
              "Ledge","South","Central","Ledge",
              "Central","South","Ledge","South",
              "South","South","Ledge","South",
              "Ledge","South","Central","Ledge",
              "Central","Central","South","Ledge",
              "South","Ledge","South","South",
              "Ledge","Central","South","Ledge",
              "Ledge","South","Central","Ledge",
              "South","South","Ledge","South"))
fac
names=fac
colours = c("red","blue","green")
xyplot(
  PC2 ~ PC1, groups=fac, data=as.data.frame(pca$x), pch=16, cex=2,
  panel=function(x, y, ...) {
    panel.xyplot(x, y, ...);
    ltext(x=x, y=y, labels=names, pos=1, offset=0.8, cex=1)
  },
  aspect = "fill", col=colours,
  #main = draw.key(key = list(rect = list(col = list(col=colours), text = list(levels(fac)), rep = FALSE)))
)


# date

fac= factor(c("Oct2012","June2012","June2012","JanFeb2013",
              "JanFeb2013","Oct2012","JanFeb2013","Oct2012",
              "Oct2012","Oct2012","JanFeb2013","Oct2012",
              "June2012","June2012","June2012","June2012",
              "JanFeb2013","JanFeb2013","JanFeb2013","JanFeb2013",
              "June2012","June2012","JanFeb2013","JanFeb2013",
              "June2012","June2012","June2012","June2012",
              "JanFeb2013","JanFeb2013","JanFeb2013","JanFeb2013",
              "Oct2012","JanFeb2013","Oct2012","Oct2012",
              "Oct2012","June2012","June2012","June2012",
              "JanFeb2013","JanFeb2013","JanFeb2013","JanFeb2013"))
fac
names=fac
colours = c("red","blue","green")
xyplot(
  PC2 ~ PC1, groups=fac, data=as.data.frame(pca$x), pch=16, cex=2,
  panel=function(x, y, ...) {
    panel.xyplot(x, y, ...);
    ltext(x=x, y=y, labels=names, pos=1, offset=0.8, cex=1)
  },
  aspect = "fill", col=colours,
  #main = draw.key(key = list(rect = list(col = list(col=colours), text = list(levels(fac)), rep = FALSE)))
)

# var

fac= factor(c("South_Oct2012","Ledge_June2012","South_June2012","Ledge_JanFeb2013",
              "Central_JanFeb2013","South_Oct2012","Ledge_JanFeb2013","Ledge_Oct2012",
              "Ledge_Oct2012","South_Oct2012","Central_JanFeb2013","Ledge_Oct2012",
              "Central_June2012","South_June2012","Ledge_June2012","South_June2012",
              "South_JanFeb2013","South_JanFeb2013","Ledge_JanFeb2013","South_JanFeb2013",
              "Ledge_June2012","South_June2012","Central_JanFeb2013","Ledge_JanFeb2013",
              "Central_June2012","Central_June2012","South_June2012","Ledge_June2012",
              "South_JanFeb2013","Ledge_JanFeb2013","South_JanFeb2013","South_JanFeb2013",
              "Ledge_Oct2012","Central_JanFeb2013","South_Oct2012","Ledge_Oct2012",
              "Ledge_Oct2012","South_June2012","Central_June2012","Ledge_June2012",
              "South_JanFeb2013","South_JanFeb2013","Ledge_JanFeb2013","South_JanFeb2013"))
fac
names=fac
colours = c("red","blue","green","yellow","deeppink","black","lightblue","purple")
xyplot(
  PC2 ~ PC1, groups=fac, data=as.data.frame(pca$x), pch=16, cex=2,
  panel=function(x, y, ...) {
    panel.xyplot(x, y, ...);
    ltext(x=x, y=y, labels=names, pos=1, offset=0.8, cex=1)
  },
  aspect = "fill", col=colours,
  #main = draw.key(key = list(rect = list(col = list(col=colours), text = list(levels(fac)), rep = FALSE)))
)

###

experimentData<-new("MIAME",name="Lisa Cohen, Joshua Voss, Sara Edge, Jeff Beal",
                    lab="Marine Functional Genomics, HBOI",
                    contact="ljcohen@ucdavis.edu",
                    title="St. Lucie Reef Seasonal Samples 2011",
                    abstract="ExpressionSet for SLR 2011 Microarray Data",
                    other=list(notes="Created from GenePix *.gpr files"))
sample_info<-read.csv("targets_experiment_sample_info_revised_again.csv")
sample_info_matrix<-as.matrix(sample_info)
sample_info_matrix<-sample_info_matrix[,-1]
rownames(sample_info_matrix)<-sample_info$X
head(sample_info_matrix)
sample_info_dataframe<-as.data.frame(sample_info_matrix)
head(sample_info_dataframe)
pd<-new("AnnotatedDataFrame",data=sample_info_dataframe)
SLR_sum<-table(sample_info_dataframe$Site,sample_info_dataframe$Date)
SLR_sum
annotation<-read.csv("mote_09_jpn_annotation.csv")
annotation_matrix<-as.matrix(annotation)
annotation_dataframe<-as.data.frame(annotation_matrix)
rownames(annotation_dataframe)<-make.names(annotation_dataframe$Name,unique=TRUE)
#SLR_ExpressionSet<-new("ExpressionSet",exprs=SLR_matrix_shift1,phenoData=pd,experimentData=experimentData,featureData=an_feature)
#QA<-arrayQualityMetrics(expressionset=SLR_ExpressionSet,outdir="QAreport_notransform",force=TRUE,intgroup=c("Chip.Number","Hyb.Date","Array"))

#write.table(norm_SLR_matrix_shift1_log2,"norm_SLR_matrix_shift1_log2_3.13.2014.txt",sep="\t")


sorted_annotationdataframe<-annotation_dataframe[order(rownames(annotation_dataframe)),]
sorted_norm_SLR_matrix_shift1_log2<-norm_SLR_matrix_shift1_log2[order(rownames(norm_SLR_matrix_shift1_log2)),]
#head(sorted_norm_SLR_matrix_shift1_log2)
#head(sorted_annotationdataframe$featureID)
#write.table(sorted_norm_SLR_matrix_shift1_log2,"norm_SLR_matrix_shift1_log2_3.13.2014.txt",sep="\t")
an_feature<-new("AnnotatedDataFrame",data=sorted_annotationdataframe)
#write.table(sorted_annotationdataframe,"annotation_uniquenames.txt",sep="\t")
plusprobenames<-cbind(sorted_norm_SLR_matrix_shift1_log2,sorted_annotationdataframe$Probe)
mean_probe<-aggregate(plusprobenames,by=list(ID=plusprobenames[,45]),FUN="mean",na.rm=TRUE)
sd_probe<-aggregate(plusprobenames,by=list(ID=plusprobenames[,45]),FUN="sd",na.rm=TRUE)
sorted_annotationdataframe<-annotation_dataframe[order(rownames(annotation_dataframe)),]
#write.table(sd_probe,"standarddeviation_mean_byprobe_3.17.2014.txt",sep="\t")
#write.table(mean_probe,"mean_byprobe_3.17.2014.txt",sep="\t")
annotation_collapse<-read.csv("mote_09_jpn_annotation_collapse.csv")
unique_annotation_collapse<-annotation_collapse[!duplicated(annotation_collapse$Probe),]
rownames(unique_annotation_collapse)<-make.names(unique_annotation_collapse$Probe,unique=TRUE)
unique_annotation_collapse<-unique_annotation_collapse[,-9]
unique_annotation_collapse<-unique_annotation_collapse[,-8]
head(unique_annotation_collapse)
an_probe<-new("AnnotatedDataFrame",data=unique_annotation_collapse)
#matrix
#data frame
mean_probe_edit<-as.matrix(mean_probe[,-46])
mean_probe_edit<-mean_probe_edit[,-1]
rownames(mean_probe_edit)<-rownames(unique_annotation_collapse)
SLR_probesummary_normExpressionSet_log2<-new("ExpressionSet",exprs=mean_probe_edit,phenoData=pd,experimentData=experimentData,featureData=an_probe)
#QA_log2<-arrayQualityMetrics(expressionset=SLR_normExpressionSet_log2,outdir="QAreport_log2transform_normBetweenArrays",force=TRUE,intgroup=c("Chip.Number","Hyb.Date","Array"))

#SLR_ExpressionSet_log2_Loess<-new("ExpressionSet",exprs=SLR_matrix_shift1_log2_Loess,phenoData=pd,experimentData=experimentData,featureData=an_feature)
#QA_log2_Loess<-arrayQualityMetrics(expressionset=SLR_ExpressionSet_log2_Loess,outdir="QAreport_log2transform_Loess",force=TRUE,intgroup=c("Chip.Number","Hyb.Date","Array"))
#SLR_design<-model.matrix(~0+factor(Site)*factor(Date),sample_info_dataframe)
#heatmap(exprs(SLR_ExpressionSet_log2))
#probe<-read.csv("SEdge_microarray_composition_revisit_2010.csv")
#head(probe)
#an_probe<-new("AnnotatedDataFrame",data=probe)
#Select the 50 genes with the highest variation (standard deviation) across chips
#rsd <- apply(exprs(SLR_ExpressionSet_log2_Loess), 1, sd)
#sel <- order(rsd, decreasing = TRUE)[1:50]
#heatmap(exprs(SLR_ExpressionSet_log2_Loess)[sel, ])
var<-factor(c(1,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,8,8,8,8),labels=c("CentralJanFeb13","LedgeJanFeb13","SouthJanFeb13","CentralJun12","LedgeJun12","SouthJun12","LedgeOct12","SouthOct12"))
design<-model.matrix(~0+var)
cmtx_time<-makeContrasts("varCentralJanFeb13-varLedgeJanFeb13","varSouthJanFeb13-varLedgeJanFeb13","varSouthJanFeb13-varCentralJanFeb13","varCentralJun12-varLedgeJun12","varSouthJun12-varCentralJun12","varLedgeJun12-varSouthJun12","varLedgeOct12-varSouthOct12",levels=design)
cmtx_site<-makeContrasts("varCentralJanFeb13-varCentralJun12","varLedgeJanFeb13-varLedgeOct12","varLedgeJanFeb13-varLedgeJun12","varLedgeJun12-varLedgeOct12","varSouthJanFeb13-varSouthOct12","varSouthOct12-varSouthJun12","varSouthJun12-varSouthJanFeb13",levels=design)
#fit<-lmFit(SLR_probesummary_normExpressionSet_log2,design=design)
fit2_time<-eBayes(contrasts.fit(lmFit(SLR_probesummary_normExpressionSet_log2,design),cmtx_time))
fit2_site<-eBayes(contrasts.fit(lmFit(SLR_probesummary_normExpressionSet_log2,design),cmtx_site))
results_time<-decideTests(fit2_time,method="global")
results_site<-decideTests(fit2_site,method="global")
summary(results_site)
write.table(results_site,"SLR_results_site.txt",sep="\t")
summary(results_time)
write.table(results_time,"SLR_results_time.txt",sep="\t")
top_table<-topTable(fit2_site, coef="varLedgeJanFeb13-varLedgeOct12", adjust.method="BH", sort.by="logFC", number=rownames(mean_probe_edit))
write.table(top_table,"top_table_varLedgeJanFeb13-varLedgeOct12.txt",sep="\t")
