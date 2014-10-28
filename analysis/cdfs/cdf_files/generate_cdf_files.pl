#!/usr/bin/perl

# Generate prices per cat, output to R script

use strict;
use warnings;

while (<>) {
    open my $FILE, ">$." or die;

    print $FILE $_;

    close $FILE;
}


