#!/usr/bin/perl

use strict;
use warnings;

my %user_reviews_count;
my %user_helpfulness;

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

    $user_reviews_count{$userId}++;
    push @{$user_helpfulness{$userId}}, $help;
}

for my $userId (keys %user_reviews_count) {
    my @helps = @{$user_helpfulness{$userId}};

    my $sum = 0;
    my $count = 0;
    for my $help (@helps) {
        $help =~ /(\d+)\/(\d+)/ or die;
        my $num = $1;
        my $den = $2;

        goto END if $den ==0 || $num > $den;

        my $fraction = ($num * 1.0) / $den;
        $sum += $fraction;
        $count++;
    }

    print "$user_reviews_count{$userId} ",$sum/$count,"\n";

END:
}

