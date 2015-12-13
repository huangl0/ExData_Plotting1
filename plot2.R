rdat<-scan(file="household_power_consumption.txt",what=list("","",0,0,0,0,0,0,0),nmax=48*60,skip=66240+1+396,sep=";",na.string=TRUE)
colnames<-scan(file="household_power_consumption.txt",what="",sep=";",nmax=9);
data<-as.data.frame(rdat)
names(data)<-colnames
datetime<-paste(data[,1],data[,2])
datetime<-strptime(datetime,format='%d/%m/%Y %H:%M:%S')
data<-data.frame(datetime,data)
summary(data)
png(filename="plot2.png",width=480,height=480)
plot(data$Global_active_power~data$datetime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
