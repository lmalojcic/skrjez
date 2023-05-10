#!/usr/bin/perl

use open ':locale';
use locale;
use utf8;

$length = pop(@ARGV);
%count;
while (defined($row = <>)){
    chomp($row);
    my $lc_row = lc($row);
    my @words = split(" ", $lc_row);
    foreach $word (@words) {
        $word =~ s/[\p{P}\p{S}]+//g;
        if ($length <= length($word)) {
            $word = substr($word, 0, $length);
            if ($word ne "") {
                $count{$word}++;
            }
        }
    }
}

foreach $word (sort keys %count) {
    printf("%s : %d\n", $word, $count{$word});
}