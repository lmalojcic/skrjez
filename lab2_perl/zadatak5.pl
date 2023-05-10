#!/usr/bin/perl

$file = $ARGV[0];

open($handle, "<" ,$file);
$first = 1;
%final_grades;
while (defined($row = <$handle>)){
    chomp($row);
    if (substr($row, 0, 1) eq "#" or $row eq "") {
        next;
    } else {
        if ($first == 1) {
            $first = 0;
            @header = split(";", $row);
            $length = @header;
            next;
        } else {
            my ($jmbag, $surname, $name, $grades) = ($row =~ /^(\d{10});([^;]+);([^;]+);(.*)/);
            @grades = split(";", $grades);
            $sum = 0;
            foreach (0..$length-1){
                if ($grades[$_] ne "-"){
                    $sum += $grades[$_] * $header[$_];
                }
            }
            $student = "$surname, $name ($jmbag)";
            $final_grades{$student} = $sum;
        }
    }
}
$rank = 1;
print "Lista po rangu:\n-------------------\n";
foreach $student (sort {$final_grades{$b} <=> $final_grades{$a}} keys %final_grades) {
    printf("%d. %s: %.2f\n", $rank ,$student, $final_grades{$student});
    $rank++;
}
close($handle);