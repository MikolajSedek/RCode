#tutaj zapiszemy nasz kod
obiekt1 = 10

obiekt2 = log1p(obiekt1)^2

obiekt3 = round(obiekt2, 0)

obiekt4 = obiekt3 > obiekt2

obiekt5 = FALSE*obiekt4

#pomoc dot. funkcji
?log1p

help("round")

#obiekty moga byc tekstowe

zdanie1 = "Ala ma"
zdanie2 = "kota"

zdanie3 = paste(zdanie1, zdanie2, sep=" ")

zdanie3_male = tolower(zdanie3)
zdanie3_duze = toupper(zdanie3)

#konwersja typów

obiekt6 = "12"
obiekt7 = 12

print(obiekt6+1)
print(obiekt7+1)

obiekt6_liczbowy = as.integer(obiekt6)

print(obiekt6_liczbowy+1)

zdanie4 = paste(zdanie3,"oraz",as.character(3),"psy", sep=" ")

#zadanie 1

x1= 1000
x2 = "50"
x3 = TRUE
x4 = "Choc mieli do pokonania"

#uzywajac funkcji paste, as.character, as.intiger polacz obiekty w jedno zdanie dodajac wlasny tekst

#wektory i listy

wektor1 = c(1,2,3,4,5,10,50,80,1000)

print(sum(wektor1))
print(mean(wektor1))
print(median(wektor1))

hist(wektor1)

#operacja matematyczna na calym wektorze
wektor2 = log1p(wektor1)

#standaryzacja zmiennych z uzyciem funkcji scale
wektor3 = 1:100
wektor4 = 101:200

length(wektor3) == length(wektor4)

wektor3 == wektor4

wektor3z = scale(wektor3)
wektor4z = scale(wektor4)

#sprawdzmy czy wektory sa identyczne za pomoca róznicy zbiorów

length(setdiff(wektor3z,wektor4z)) == 0

#sekwencje i powtórzenia

wektor5 = seq(from = -10, to=100, by=0.3)

wektor6 = rep(wektor5, times=10)

wektor6_unq = sort(unique(wektor6))

length(setdiff(wektor5, wektor6_unq)) == 0 

#obsluga braków danych

wektor7 = c(4:10, NA, NaN)

print(mean(wektor7))

print(mean(wektor7, na.rm = T))
print(sum(wektor7, na.rm = T))

#zastepowanie braków danych

wektor8 = rep(c(1:1000, NA, NaN), 1000)

is.na(wektor8[999:1020])

#sprawdzmy ile mamy braków danych
table(is.na(wektor8))

#zastapmy je srednia

wektor8[is.na(wektor8)] = mean(wektor8, na.rm = T)

table(is.na(wektor8))

#usuniecie obiektu (bezpowrotne!!!)

rm(wektor8)

#jeszcze troche operacji na wektorach

wektor9 = 1:10
wektor9[1:5]
wektor9[c(1,5,9)]
wektor9[10:1]
wektor9[seq(from=5,to=9, by=2)]

print(wektor9 + wektor9)
print(wektor9 * wektor9)

#nadpisanie fragmentu wektora
wektor10 = 1:100
wektor10[51:100] = rep(c(1,16),times=25)


#lista
lista1 = list(x="10",y=10,a=TRUE,b= 1:100)
print(lista1)
print(lista1$x)
print(lista1$b)


#macierze i tabele danych 

macierz1 = matrix(1:1000, nrow=100, ncol=10)
View(macierz1)

#wyswietlimy pierwszy wiersz
macierz1[1,]

#wiersze 1,10,21

macierz1[c(1,10,21),]

#zastapimy 10 kolumne logarytmem z jej wartosci

macierz1[,10] = log1p(macierz1[,10])

View(macierz1)

#znormalizujmy pierwsze 9 kolumn :) - skorzystajmy z funkcji apply (nieprawdopodobnie przydatna)

macierz1_norm = apply(X = macierz1[,1:9], MARGIN = 2, FUN=scale)

#ale brakuje nam 10 kolumny z poprzedniej - uzupelnijmy to

macierz1_norm_10c = cbind(macierz1_norm, macierz1[,10])

str(macierz1_norm_10c)
summary(macierz1_norm_10c)



######petle FOR i WHILE

sekwencja1 = seq(0,1,0.1)

dane = sample(sekwencja1,size=100000, replace=T)

macierz2 = matrix(dane, nrow=100, ncol=1000)

print(str(macierz2))

#zastosowanie funkcji do wszystkich kolumn macierzy z petla FOR


macierz2[1:10,1:10]

for (i in 1:ncol(macierz2)){

macierz2[,i]= scale(log1p(macierz2[,i]))
  
}

macierz2[1:10,1:10]

#to samo z petla WHILE - trwa dopóki jakis warunek jest prawdziwy, uwaga na INFINITE LOOP!

#resetujemy macierz
macierz2 = matrix(dane, nrow=100, ncol=1000)
macierz2[1:10,1:10]


i=1

while (i<=ncol(macierz2)){
macierz2[,i]= scale(log1p(macierz2[,i]))
#bardzo wazny element petli WHILE ponizej
i=i+1
}
macierz2[1:10,1:10]


#resetujemy macierz
macierz2 = matrix(dane, nrow=100, ncol=1000)
macierz2[1:10,1:10]


# z wykorzystaniem if i break statement
i=1

while (1==1){
  macierz2[,i]= scale(log1p(macierz2[,i]))
  #bardzo wazny element petli WHILE ponizej
  i=i+1
  #dodajemy break
  if (i>ncol(macierz2)) {break}
  }
macierz2[1:10,1:10]






