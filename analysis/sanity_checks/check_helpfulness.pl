#!/usr/bin/perl

# Check helpfulness

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

    $help =~ m/(\d+)\/(\d+)/;
    my $numerator = $1;
    my $denominator = $2;

    die unless $numerator >= 0 && $denominator >= 0;
    die unless $numerator <= $denominator;
}

