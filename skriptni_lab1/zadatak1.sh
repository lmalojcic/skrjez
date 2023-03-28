#!/bin/bash

#Postaviti varijablu ljuske proba na vrijednost "Ovo je proba". Ispisati vrijednost postavljene varijable.
proba="Ovo je proba"
echo $proba

#U varijablu lista_datoteka upisati listu svih datoteka tekućeg kazala. Pritom iskoristiti širenje imena datoteke. Ispisati rezultat.
lista_datoteka=*
echo $lista_datoteka

#U varijablu ljuske proba3 upisati 3 puta nadovezanu vrijednost varijable proba, pri čemu na svaku rečenicu treba dodati točku i razmak.
proba3=$proba". "$proba". "$proba". "
echo $proba3

#Varijablu a postaviti na vrijednost 4, varijablu b na 3, varijablu c na 7. Zatim u varijablu d upisati vrijednost koja se dobije izrazom (a + 4) ∗ b%c. Upotrijebiti širenje aritmetičkih izraza. Ispisati vrijednosti varijabli a, b, c i d.
a=4
b=3
c=7
d=$((($a+4)*$b%$c))
echo $a $b $c $d

#U varijablu broj_rijeci upisati ukupan broj riječi u .txt datotekama tekućeg kazala. Upotrijebiti supstituciju naredbe i naredbu wc.
broj_rijeci=$(wc -w *.txt | tail -n 1 | sed 's/^[[:space:]]*//' | cut -d' ' -f1)
echo "$broj_rijeci"

#Ispisati sadržaj Vašeg matičnog kazala primjenom tilda-ekspanzije.
ls ~