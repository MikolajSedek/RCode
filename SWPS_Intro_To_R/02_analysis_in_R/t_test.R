setwd("C:/RCode")

#tworzymy dwa wekory danych

nonsmokers = c(18,22,21,17,20,17,23,20,22,21)
smokers = c(16,20,14,21,20,18,13,15,17,21)

#poskladajmy to do data frame

scores = c(nonsmokers, smokers)
groups = c("nonsmokers","smokers")        
groups = rep(groups, times=c(10,10))      
data_ttest = data.frame(groups, scores)

#zapiszmy dane

write.csv2(data_ttest, "dane_ttest.csv")

#wczytajmy dane do nowego obiektu

data_ttest2 = read.csv2("dane_ttest.csv")

View(data_ttest2)

str(data_ttest2)

summary(data_ttest2[,2:3])

boxplot(scores ~ groups, data = data_ttest2)

ttest_results1 = t.test(scores ~ groups, data = data_ttest2)

print(ttest_results1)

ttest_results2 = t.test(scores ~ groups, data = data_ttest2, alternative="greater", var.equal=T)

print(ttest_results2)

print(ttest_results2$statistic)
print(ttest_results2$parameter)
barplot(ttest_results2$estimate)

#zróbmy ladniejszy wykres
install.packages("ggplot2")

library(ggplot2)

p <-ggplot(data_ttest2, aes(groups, scores, fill = as.factor(groups)))
p +geom_bar(stat = "summary", fun.y="mean")



