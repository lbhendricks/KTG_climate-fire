# a little test
library(zoo)

# generate a random vector to play with
t<-sample(1:10,20,replace=T)
print(t)

# put in some random NAs
index<-sample(1:20,5)
t[index]<-NA
print(t)

# fill in the missing values with rollaply
t_smooth<-rollapply(t,window,FUN=mean,fill=NA,partial=1,na.rm=T)
print(t_smooth)

# round it just so it is easier to look at
t_smooth<-round(t_smooth,0)   
print(t_smooth)

# now fill in values in t with values from t_smooth
t[is.na(t)]<-t_smooth[is.na(t)]

# keep a copy of the original t to make sure things happened how we wanted
t_og<-t

# now look at what happened
print(t_og)
print(t_smooth)
print(t)

## IT LOOKS LIKE IT WORKS!!!!!!!