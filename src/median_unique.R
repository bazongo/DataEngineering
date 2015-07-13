setwd("C:/Users/hp Probook 4540s/Desktop/Data Fellow competition")
#use stringr package
require(stringr)
#Read input data
news <- readLines("tweet_input/tweets.txt")
#Spli each tweet into single word
words<- sapply(news, function(x) str_split(x, " "))
#Get the number of unique words per tweet
words<- sapply(words, function(x) length(unique(x)))
#Convert vector into data.frame
words<-as.data.frame(words)
#Change rows names in number
rownames(words)<-1:dim(words)[1]
#add a rank variable to get the position of each observation
words$rank<-as.numeric(rownames(words))
#Define locale function to compute the position 
indice<-function(vec){
  index=vec[length(vec)]
  return(index)
}
#get the median after each tweet
words<-apply(words, 1,function(x) median(words$words[1:indice(x)]))
#Covert vector into data.frame object
words<-as.data.frame(words)
#Save output in text file into tweet_output folder
write.table(words, file ="tweet_output/ft2.txt",row.names=FALSE, col.names = FALSE,quote=FALSE)
#End of this exercice


