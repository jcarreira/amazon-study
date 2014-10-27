#!/usr/bin/perl

# Filter original data
# Output product, price, userId, help, score, time

use strict;
use warnings;

while (<>) {
# start of a new review
    die "productId expected" unless /productId/;

    $_ =~ /product\/productId: ([^\n]+)/;
    my $productId = $1;
    my $price;
    my $userId;
    my $help;
    my $score;
    my $time;
    my $words_summary;
    my $words_review;
    my $number_words_review = 0;

    while (<>) {
        last if /^$/;

        if ($_ =~ /review\/userId: ([^\n]+)/) {
            $userId = $1;
        } elsif ($_ =~ /review\/helpfulness: ([^\n]+)/) {
            $help = $1;
        } elsif ($_ =~ /product\/price: ([^\n]+)/) {
            $price = $1;
        } elsif ($_ =~ /review\/score: ([^\n]+)/) {
            $score = $1;
        } elsif ($_ =~ /review\/time: ([^\n]+)/) {
            $time = $1;
        } elsif ($_ =~ /review\/text: ([^\n]+)/) {
            my $text = $1;
            $number_words_review = 0;
            ++$number_words_review while $text =~ /\S+/g;
        }
    }

    die unless defined $price;
    die unless defined $userId;
    die unless defined $help;
    die unless defined $score;
    die unless defined $time;
    die unless defined $number_words_review;

    print "$productId $price $userId $help $score $time $number_words_review\n";
}

