#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
    my @tokens = split /\s/;

    my $helpful = $tokens[3];
    my $size = $tokens[6];
    die unless defined $helpful;
    die unless defined $size;

    die unless $helpful =~ m/(\d+)\/(\d+)/g;
    my $num = $1;
    my $den = $2;

    next if $den < 20;

    my $fraction = $num / $den;

    print "$size $fraction\n";
}

