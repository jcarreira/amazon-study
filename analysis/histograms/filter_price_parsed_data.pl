#!/usr/bin/perl

# Print prices

use strict;
use warnings;

while (<>) {
    my @tokens = split /\s/;

    my $price = $tokens[1];
    die unless defined $price;

    print "$price\n";
}

