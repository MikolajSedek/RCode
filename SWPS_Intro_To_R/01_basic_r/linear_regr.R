### ładujemy bibliotekę lattice

library(lattice)

### tworzymy ramkę danych

alligator = data.frame(
  lnLength = c(3.87, 3.61, 4.33, 3.43, 3.81, 3.83, 3.46, 3.76,
               3.50, 3.58, 4.19, 3.78, 3.71, 3.73, 3.78),
  lnWeight = c(4.87, 3.93, 6.46, 3.33, 4.38, 4.70, 3.50, 4.50,
               3.58, 3.64, 5.90, 4.43, 4.38, 4.42, 4.25)
)

#liczymy korelację

korelacja = cor(alligator$lnLength,alligator$lnWeight)
print(korelacja)

#rysujemy wykres

xyplot(lnWeight ~ lnLength, data = alligator,
       xlab = "Snout vent length (inches) on log scale",
       ylab = "Weight (pounds) on log scale",
       main = "Alligators in Central Florida"
)

#liczymy model regresji liniowej

alli.mod1 = lm(lnWeight ~ lnLength, data = alligator)

#podsumowanie modelu

summary(alli.mod1)

print(alli.mod1$coefficients)

#zobaczmy rozkład reszt - może trzeba przeprowadzić analizę reszt dla regresji

hist(alli.mod1$residuals, freq=FALSE,  main="Residuals distribution", col="lightgreen")
curve(dnorm(x, mean=mean(alli.mod1$residuals), sd=sd(alli.mod1$residuals)), add=TRUE, col="darkblue", lwd=2) 

#zapiszmy obiekt z modelem
saveRDS(alli.mod1, "model1.rds")
