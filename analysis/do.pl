#!/usr/bin/perl

use strict;
use warnings;

while (<>) {
# start of a new review
    die "productId expected" unless /productId/;

    $_ =~ /productId: ([^\n]+)/;
    my $productId = $1;
    my $price;
    my $userId;
    my $help;
    my $score;
    my $time;
    my $words_summary;
    my $words_review;

    while (<>) {
        last if /^$/;

        if ($_ =~ /userId: ([^\n]+)/) {
            $userId = $1;
        } elsif ($_ =~ /helpfulness: ([^\n]+)/) {
            $help = $1;
        } elsif ($_ =~ /price: ([^\n]+)/) {
            $price = $1;
        } elsif ($_ =~ /score: ([^\n]+)/) {
            $score = $1;
        } elsif ($_ =~ /time: ([^\n]+)/) {
            $time = $1;
        }
    }

    die unless defined $price;
    die unless defined $userId;
    die unless defined $help;
    die unless defined $score;
    die unless defined $time;

    print "$productId $price $userId $help $score $time\n";
}
