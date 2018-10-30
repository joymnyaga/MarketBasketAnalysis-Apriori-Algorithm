#Load libraries
library(arules)
library(arulesViz)

#Load data as transactions
data=read.transactions("file:///D:/Data Sets - R/Store Data Apyori/store data.csv")
inspect(head(data))
list(data) #7501 transactions

#Find top 10 most frequent items
frequentItems=eclat(data,parameter=list(supp=0.07,maxlen=15))
inspect(frequentItems)

#Plot frequency of items
itemFrequencyPlot(data,topN=10,main="Item Frquency")

#Apriori algorithm
rules=apriori(data,parameter=list(supp=0.001, confidence=0.5))

#Top 10 rules by confidence
sort_rules=sort(rules,by="confidence",decreasing=TRUE)
inspect(head(sort_rules,n=10))

#Visualize association rules
subrules=head(rules,n=10,by="confidence")
plot(subrules,method="graph")

