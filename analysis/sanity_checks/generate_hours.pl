#!/usr/bin/perl

# Check scores

use strict;
use warnings;

while (<>) {
    my @tokens = split, /\s+/;

    my $productId;
    my $price;
    my $userId;
    my $help;
    my $score;
    my $time;

    ($productId, $price, $userId, $help, $score, $time) = @tokens;

    die unless defined $price;
    die unless defined $userId;
    die unless defined $help;
    die unless defined $score;
    die unless defined $time;

    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($time);
    print "$hour $min $sec $mday $year $wday $yday $isdst\n";
}

