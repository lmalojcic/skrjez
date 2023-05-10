#!/usr/bin/perl

my %count;

while (defined($row = <>)) {
    chomp($row);
    my ($day, $month, $year, $hour) = ($row =~ /(\d+)\/(\w+)\/(\d+):(\d+):\d+:\d+/);
    my $date = "$year-$month-$day";
    $count{$date}{$hour}++;
}

foreach my $date (sort keys %count) {
    print " Datum: $date\n sat : broj pristupa\n-------------------------------\n";
    foreach my $hour (sort keys %{$count{$date}}) {
        printf(" %02d : %d\n", $hour, $count{$date}{$hour});
    }
    print "\n";
}
