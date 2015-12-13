rdat<-scan(file="household_power_consumption.txt",what=list("","",0,0,0,0,0,0,0),nmax=48*60,skip=66240+1+396,sep=";",na.string=TRUE)
colnames<-scan(file="household_power_consumption.txt",what="",sep=";",nmax=9);
data<-as.data.frame(rdat)
names(data)<-colnames
datetime<-paste(data[,1],data[,2])
datetime<-strptime(datetime,format='%d/%m/%Y %H:%M:%S')
data<-data.frame(datetime,data)
summary(data)
png(filename="plot3.png",width=480,height=480)
plot(data$Sub_metering_1~data$datetime,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(data$Sub_metering_2~data$datetime,type="l",col="red")
lines(data$Sub_metering_3~data$datetime,type="l",col="blue")
legend("topright",lty=1,cex=0.5,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
