#!/usr/bin/perl

# Generate prices per cat, output to R script

use strict;
use warnings;

my %prices_per_category;
my %seen; # flag that tells if product's price has been registered

while (<>) {

    my @tokens = split, /\s+/;

    my $productId;
    my $price;
    my $userId;
    my $help;
    my $score;
    my $time;
    my $nwords;
    my $categories;

    ($productId, $price, $userId, $help, $score, $time, $nwords, $categories) = @tokens;

    die unless defined $price;
    die unless defined $userId;
    die unless defined $help;
    die unless defined $score;
    die unless defined $time;
    die unless defined $nwords;
    die unless defined $categories;
    
    next if $price eq "unknown";
    next if exists $seen{$productId};

    $seen{$productId} = 1;

    my @cats = split /-/, $categories;
    for (@cats) {
        push @{$prices_per_category{$_}}, $price;
    }
}

for my $cat (sort { $a <=> $b } keys %prices_per_category) {
    print "@{$prices_per_category{$cat}} \n";
}

