#!/usr/bin/perl
use DateTime;

while (defined($row = <>)){
    if ($row =~ /^\d{10}/) {
        my ($jmbag, $surname, $name, $lab_date, $lab_time, $turnin_date, $turnin_time) = ($row =~ /^(\d{10});([^;]+);([^;]+);(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}) \d{2}:\d{2}[^;]+;(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2})/);
        
        my $lab_datetime = DateTime->new(
            year => substr($lab_date, 0, 4),
            month => substr($lab_date, 5, 2),
            day => substr($lab_date, 8, 2),
            hour => substr($lab_time, 0, 2),
            minute => substr($lab_time, 3, 2)
        );
        $lab_datetime->add(hours => 1);

        my $turnin_datetime = DateTime->new(
            year => substr($turnin_date, 0, 4),
            month => substr($turnin_date, 5, 2),
            day => substr($turnin_date, 8, 2),
            hour => substr($turnin_time, 0, 2),
            minute => substr($turnin_time, 3, 2),
            second => substr($turnin_time, 6, 2)
        );

        if ($turnin_datetime > $lab_datetime) {
            print "$jmbag $surname $name - PROBLEM: $lab_date $lab_time --> $turnin_date $turnin_time"
        }
    }
}