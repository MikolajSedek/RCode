
#pobieramy dane
data(InsectSprays)

#ogl¹damy dane
str(InsectSprays)

summary(InsectSprays)

#liczymy analizê wariancji
anova1 = aov(count~spray, data=InsectSprays)

summary(anova1)

#ale czy wariancja jest homogeniczna
bartlett.test(count ~ spray, data=InsectSprays)

install.packages("car")
library(car) 

leveneTest(y=InsectSprays$count, group=InsectSprays$spray, center=mean)

oneway.test(count ~ spray, data=InsectSprays, var.eq=F)

TukeyHSD(anova1)

pairwise.t.test(InsectSprays$count, InsectSprays$spray, p.adj = "holm")

pairwise.t.test(InsectSprays$count, InsectSprays$spray, p.adj = "bonferroni")





