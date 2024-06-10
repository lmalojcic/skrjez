#!/usr/bin/perl
print "Upisi niz znakova: ";
chomp($chars = <STDIN>);

print "Upisi broj ponavljanja: ";
chomp($num = <STDIN>);

foreach (1..$num){
    printf "%s\n", $chars;
}