data<-readLines("C:/Users/vara lakshmi/Desktop/moviereview.txt")
data
str(data)
data<-paste(readLines("C:/Users/vara lakshmi/Desktop/moviereview.txt"),collapse = "")
str(data)
doc<-gsub("\\W"," ",data)
doc
doc1<-tolower(doc)
doc1
library(tm)
library(NLP)
doc2<-removeWords(doc1,stopwords())
doc2
doc3<-gsub("\\b[A-z]\\b{1}"," ",doc2)
doc3
doc4<-stripWhitespace(doc3)
doc4
library(stringr)
library(sentimentr)
doc5<-str_split(doc4,"\\s+")
doc5
str(doc5)
class(doc5)
doc6<- unlist(doc5)
doc6
class(doc6)
str(doc6)
pos.words<-read.csv(file= file.choose())
pos.words
class(pos.words)
str(pos.words)
pos.words<-unlist(pos.words)
pos.words
neg.words<-read.csv(file=file.choose())

neg.words<-unlist(neg.words)
class(neg.words)
str(neg.words)
data<-match(doc6, pos.words)
data
match(doc6, neg.words)
!is.na(match(doc6,pos.words))
sum(!is.na(match(doc6,pos.words)))
table(!is.na(match(doc6,pos.words)))
sum(!is.na(match(doc6,neg.words)))
table(!is.na(match(doc6,neg.words)))
score<-sum(!is.na(match(doc6,pos.words)))-sum(!is.na(match(doc6,neg.words)))
score
library(wordcloud)
library(RColorBrewer)
wordcloud(doc6)
wordcloud(doc6,min.freq = 10)
wordcloud(doc6,min.freq = 4,colours = rainbow)
wordcloud(match(doc6,neg.words))  
View(extract_sentiment_terms(doc6))
