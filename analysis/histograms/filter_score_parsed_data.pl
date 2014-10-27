#!/usr/bin/perl

# Print prices

use strict;
use warnings;

while (<>) {
    my @tokens = split /\s/;

    my $score = $tokens[4];
    die unless defined $score;

    print "$score\n";
}

