# Call
library(readxl)

epu.file <- paste(tempfile(), ".xlsx", sep = "")
download.file("https://www.policyuncertainty.com/media/All_Country_Data.xlsx", epu.file, mode = "wb")

epu <- read_excel(epu.file, skip = 0, sheet = 1)
epu <- as.data.frame(epu)
remove(epu.file)
#Remove lasts row (skip references and notes)
epu <- head(epu, 430)
#Since we have information on CAB only until 2020Q1, we can remove last observations
epu <- head(epu, 423)

# Work with Data in order to have a more useful format:
library(zoo)
epu$Date <- as.yearmon(paste(epu$Year, epu$Month), "%Y %m")
epu$Date <- as.Date(epu$Date)
epu$Year<- NULL
epu$Month<- NULL
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#Reordening:
source("0. Base download\\moveme.R")
epu<- epu[moveme(names(epu), "Date first")]

#Check
#library(tsbox)
#ts_plot(epu)



# EPU_full: Data from countries with data since beginning ####
#list_na = colnames(epu)[ apply(epu, 2, anyNA)]
#list_na
#remove(list_na)
list_ok <- c("Date", "Canada", "Ireland", "US", "Sweden")
epu_full <- subset(epu, select = list_ok)
remove(list_ok)

#Check
#ts_plot(epu_full)
#plot(epu_full)

#EPU_1991: starting in 1991, we add Brazil, France, Japan, and South Korea ####
epu_1991 <- epu[-(1:72),]
#list_na = colnames(epu_1991)[ apply(epu_1991, 2, anyNA)]
#list_na
#remove(list_na)
list_ok <- c("Date", "Brazil", "Canada", "France", "Ireland", "Japan","Korea", "US", "Sweden")
epu_1991 <- subset(epu_1991, select = list_ok)
remove(list_ok)

#1993: Chile, Germany
#1994: Russia
#1995: China
#1996: Mexico
#1997: The preferred. ####
#Australia, Colombia, Greece, India, Italy, Netherlands, Spain, UK, SCMP China, Mainland China
epu_1997 <- epu[-(1:144),]
#list_na = colnames(epu_1997)[ apply(epu_1997, 2, anyNA)]
#list_na
#remove(list_na)

epu_1997 <- subset(epu_1997, select = -Singapore)




# EPU 2003: starting in 2003, we add Singapore. This is the full list of avaliable countries ####
epu_2003 <- epu[-(1:216),]

#EPU All: droping missing values ####
#we keep all the countries availables, starting in 2003Q1 and ending in 2009Q3. It drops the lasts observations of Mexico (only available until 2019Q3)
epu_all <- na.omit(epu)

