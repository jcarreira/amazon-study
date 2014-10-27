#!/usr/bin/perl

# Print prices

use strict;
use warnings;

while (<>) {
    my @tokens = split /\s/;

    my $helpfulness = $tokens[3];
    die unless defined $helpfulness;

    $helpfulness =~ s/\// /g;

    print "$helpfulness\n";
}

