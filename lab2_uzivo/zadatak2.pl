#!/usr/bin/perl
$first_cond = 0;
$second_cond = 0;
$looking = 0;

%count;

while (defined($row = <>)){
    chomp($row);
    if ($first_cond and $second_cond and $looking){
        if ( $row =~ /^From: /) {
            my ($email) = ($row =~ /<([^\@]+\@[^>]+)>/);
            if ($email ne ""){
                $count{$email}++;
            }
            $first_cond = 0;
            $second_cond = 0;
            $looking = 0;
        } 
    }
    if ($row =~ /^From nobody/ and $first_cond) {
        $second_cond = 1;
        $looking = 1;
    } else {
        if (!$looking) {
            $second_cond = 0;
        }
    }
    if ( $row eq "") {
        $first_cond = 1;
    } else {
        if (!$looking) {
            $first_cond = 0;
    }
    }

}

foreach $email (reverse sort {$count{$b} <=> $count{$a}} keys %count) {
    $stars = "*" x $count{$email};
    printf("%40s : $stars (%d)\n", $email, $count{$email});
}