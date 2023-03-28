#!/bin/bash

#Napisati naredbu grep koja će u datoteci namirnice.txt prona ́ci i ispisati sve retke u kojima se pojavljuju nazivi voća (banana, jabuka, jagoda, dinja, lubenica), neovisno o tome jesu li napisani velikim ili malim slovima.
grep -i -E "(jabuka|banana|jagoda|dinja|lubenica)" namirnice.txt

#Modificirati prethodnu naredbu tako da se ispisuju samo retci u kojima se ne pojavljuju zadane riječi.
grep -i -E -v "(jabuka|banana|jagoda|dinja|lubenica)" namirnice.txt

#Napisati naredbu grep koja će u kazalu ~/projekti/ i svim njegovim podkazalima pronaći datoteke u kojima se pojavljuje šifra u obliku tri velika slova i šesteroznamenkasti broj, te ispisati retke u kojima se ta šifra pojavljuje. Šifra od ostalog teksta mora biti odvojena razmakom.
grep -E -r -c '[A-Z]{3}[0-9]{6}' ~/projekti

#Napisati naredbu koja će ispisati imena i detaljne podatke svih datoteka u tekućem kazalu i njegovim podkazalima, koje su mijenjane prije 7 do 14 dana.
find ./ -mtime +7 -a -mtime -14 -ls

#Napisati u jednom retku for petlju koja će ispisati brojeve od 1 do 15. Pritom iskoristiti izraz za generiranje sekvence ili naredbu seq.
for i in $(seq 1 15); do echo -n "$i " ; done

#Modificirati prethodnu naredbu tako da se zadnji broj raspona zadaje u varijabli kraj. Provjeriti je li svejedno koristi li se izraz za generiranje sekvence ili naredba seq.
kraj=10
for i in `seq 1 $kraj`; do echo -n "$i "; done