#!/usr/bin/perl

use strict;
use warnings;

my %positive_reviews_per_user;
my %negative_reviews_per_user;

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

    if ($score > 3) {
        $positive_reviews_per_user{$userId}++;
    }
    if ($score < 3) {
        $negative_reviews_per_user{$userId}++;
    }
}

my @keys = (keys %positive_reviews_per_user, keys %negative_reviews_per_user);

for my $key (@keys) {
    my $positive = 0;
    my $negative = 0;

    if (exists $positive_reviews_per_user{$key}) {
        $positive = $positive_reviews_per_user{$key};
    }

    if (exists $negative_reviews_per_user{$key}) {
        $negative = $negative_reviews_per_user{$key};
    }

    next if $positive + $negative < 10;

    my $positive_fraction = ($positive * 1.0) / ($positive + $negative);
    my $negative_fraction = ($negative * 1.0) / ($negative + $positive);
    print  "$positive_fraction\n";
}

