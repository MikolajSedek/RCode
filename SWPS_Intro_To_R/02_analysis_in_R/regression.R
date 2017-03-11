#doinstalujmy bibliotekê z przydatnymi funkcjami i danymi

install.packages("MASS")

library(MASS)

#wyci¹gamy dane i analizujemy

dane = crabs

str(dane)

dane = dane[,4:8]

pairs(dane)

cov.matr = cov(dane)

cov2cor(cov.matr)

#liczymy regresjê

fit <- lm(BD~FL+RW+CL+CW,data=dane)

summary(fit)

#usuwanie predyktorów metod¹ backwards

step <- stepAIC(fit, direction="backward")

summary(step)

plot(step)

#porównanie modeli

anova(fit, step)


#zapisanie modelu do pliku

saveRDS(step, "myRegModel1.rds")

#wczytanie modelu

model_regresji = readRDS("myRegModel1.rds")

summary(model_regresji)




