#!/usr/bin/perl

# Print prices

use strict;
use warnings;

my %count;

while (<>) {
    my $score = $_;
    die unless defined $score;

    $count{$score}++;

}

for my $key (keys %count) {
    print "key: $key count: ", $count{$key}, "\n";
}


