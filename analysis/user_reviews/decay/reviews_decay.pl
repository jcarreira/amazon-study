#!/usr/bin/perl

# Histogram of products lifetime

use strict;
use warnings;

my %product_review_year;

my @result_list = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
my @result_list_count;
my $count = 0;

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

    next if $time == -1;

    my ($sec1,$min1,$hour1,$mday1,$mon1,$year1,$wday1,$yday1,$isdst1) = localtime($time);

    $year1 += 1900;

    push @{${$product_review_year{$productId}}{$year1}}, $score; # save score for this year
}

for my $prod_id (sort keys %product_review_year) {
    my @normalized_list_of_scores = (1);

    my %hash = %{$product_review_year{$prod_id}}; # get hash year -> scores

    # do first year!
    my $first_year_score = 0;
    my @years_list = sort { $a <=> $b } keys %hash; # list of years
#    print "@years_list\n";
    my $first_year = shift @years_list; # get first year

    my @scores = @{$hash{$first_year}}; # get first year scores
    next if scalar @scores < 3;
    $first_year_score = get_average_score(@scores);

    my $last_year = $first_year; # keep track of last year to fix holes
    # do following years
    for my $year (sort { $a <=> $b } @years_list) { # traverse through years
        
        for (; $last_year+1 <= $year-1; $last_year++) {
            my $last = $normalized_list_of_scores[-1];
            push @normalized_list_of_scores, $last;
        }
        my @scores = @{$hash{$year}}; # get scores

        goto LABEL if scalar @scores < 3;

        my $average_score = get_average_score(@scores);
        push @normalized_list_of_scores, $average_score/$first_year_score;

        $last_year = $year;
    }

    next if scalar @normalized_list_of_scores < 5;

    #print "prod $prod_id @normalized_list_of_scores\n";

    my $i = 0;
    for my $normalized_score (@normalized_list_of_scores) {
        $result_list[$i] += $normalized_score;
        $result_list_count[$i]++;
        $i++;
    }

    print "$first_year prod: $prod_id\n" if $i > 19;
    print "years: @years_list\n" if $i > 19;
    print "norm list: @normalized_list_of_scores\n" if $i > 19;
    die unless $i <= 19;

    $count++;

    LABEL:
}

print "count: $count\n";

my $i = 0;
for my $result_value (@result_list) {
    my $value = (1.0*$result_value) / $result_list_count[$i];
    print  "$value\n";
    $i++;
}

sub get_average_score {
    my @scores = @_;

    my $total = 0;
    for my $score (@scores) {
        $total += $score;
    }
    return $total / (scalar @scores);
}

