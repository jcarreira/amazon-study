#!/usr/bin/perl

# Check price consistecy

use strict;
use warnings;

my $max = 0;

sub max {
    my $a = shift;
    my $b = shift;

    return $a > $b ? $a : $b;
}

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

    next if $price eq "unknown";

    ##die unless $price > 0;

    $max = max($max, $price);
}

print "Max price: $max\n";

