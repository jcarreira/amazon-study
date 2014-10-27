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

    next if $time == -1;

    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($time);
    print $year+1900, "\n";
    #print scalar localtime($time);

    die unless $year >= 95;
}

