#!/usr/bin/perl
print "Upisi niz brojeva odvojenih razmakom: \n";
chomp($input = <STDIN>);
@numbers = split /\s+/, $input;
$sum = 0;
$length = @numbers;
foreach (@numbers) {
    $sum = $sum + $_;
}
$avg = $sum / $length;
print("$avg");