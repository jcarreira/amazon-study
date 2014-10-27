#!/usr/bin/perl

# Histogram of reviews per user

use strict;
use warnings;

my %reviews_per_user;

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

    $reviews_per_user{$userId}++;
}

for my $key (keys %reviews_per_user) {
    print $reviews_per_user{$key}, "\n";
}

