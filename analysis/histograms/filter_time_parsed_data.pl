#!/usr/bin/perl

# Print prices

use strict;
use warnings;

while (<>) {
    my @tokens = split /\s/;

    my $time = $tokens[5];
    die unless defined $time;

    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($time);

#   print "$time $year $mon $mday $hour:$min:$sec\n";
    ##print 1900+$year," ", scalar localtime($time), "\n";
    print scalar localtime($time), "\n";
}

