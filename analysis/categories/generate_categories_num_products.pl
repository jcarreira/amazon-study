#!/usr/bin/perl

# Histogram of products lifetime

use strict;
use warnings;

my %seen;
my %num_prods_per_category;

my %category_name;
&read_categories_names();

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

    next if exists $seen{$productId};

    $seen{$productId} = 1;

    my @cats = split /-/, $categories;
    for (@cats) {
        $num_prods_per_category{$_}++;
    }
}

for my $cat (sort { $a <=> $b } keys %category_name) {
    print "\"$category_name{$cat}\" $num_prods_per_category{$cat}\n";
}

sub read_categories_names() {
    open my $FILE, "<category_description.txt" or die;

    while (<$FILE>) {
        /(\D+)(\d+)/;
        my $cat = $1;
        my $cat_id = $2;

        $category_name{$2} = $1;
    }
    close $FILE;
}

