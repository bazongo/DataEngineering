#Define work directory
setwd("C:/Users/hp Probook 4540s/Desktop/Data Fellow competition")
#use stringr package
require(stringr)
#Read input data
news <- readLines("tweet_input/tweets.txt")
#Spli each tweet into single word
words<- sapply(news, function(x) str_split(x, " "))
#Convert list into character object 
words<-unlist(words)
#Convert character object into factor object
words<-as.factor(words)
#count the number of time each word appears in the tweets
words<-table(words)
#Covert table into data.frame object
words<-as.data.frame(words)
#Save output in text file into tweet_output folder
write.table(words, file ="tweet_output/ft1.txt",row.names=FALSE, col.names = FALSE,quote=FALSE)
#End of this exercice
