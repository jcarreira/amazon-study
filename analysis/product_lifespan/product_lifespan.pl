#!/usr/bin/perl

# Histogram of products lifetime

use strict;
use warnings;

my %product_first_review;
my %product_last_review;
my %number_product_reviews;

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

    $number_product_reviews{$productId}++;
    next if $time == -1;

    # if first timestamp make it as beginning
    if (not exists $product_first_review{$productId}) {
        $product_first_review{$productId} = $time;
        $product_last_review{$productId} = $time;
    } else {
        # check that entries are ordered by timestamp
        # die if ($product_first_review{$productId} > $time);
        if ($product_first_review{$productId} > $time) {
            $product_first_review{$productId} = $time;
        }
       
        #if (exists $product_last_review{$productId}) {
        #    die if $product_last_review{$productId} > $time;
        #}

        if ($time > $product_last_review{$productId}) {
            $product_last_review{$productId} = $time;
        }
    }
}

for my $key (keys %product_first_review) {
    my $first_time = $product_first_review{$key};
    my $last_time = $product_last_review{$key};
    my $total_time = $last_time - $first_time;
   
    my ($sec1,$min1,$hour1,$mday1,$mon1,$year1,$wday1,$yday1,$isdst1) = localtime($first_time);
    my ($sec2,$min2,$hour2,$mday2,$mon2,$year2,$wday2,$yday2,$isdst2) = localtime($last_time);

    my $diff_days = calc_diff_days($first_time, $last_time);

    #print scalar localtime($product_first_review{$key}), " ", scalar localtime($product_last_review{$key}), "\n"; 
    #print $year2 - $year1, " ", $mon2-$mon1, " ", $mday2-$mday1, "\n";
    #print $year2, " ", $year1, " ", $mon2-$mon1, " ", $mday2-$mday1, "\n";
    #print "diff_days: $diff_days\n";
#
#    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($total_time);
    #print $product_last_review{$key}, " ", $product_first_review{$key}, "\n";
#
    #print "$key $diff_days\n" if ($diff_days != 0);

    # I consider a product dead if no review happens for 3 years
    next if ($year2 > 110);
    next if ($number_product_reviews{$key} < 50);

    print "$diff_days\n" if ($diff_days != 0);
}

sub calc_diff_days {
    my $first_time = shift;
    my $last_time = shift;

    my ($sec1,$min1,$hour1,$mday1,$mon1,$year1,$wday1,$yday1,$isdst1) = localtime($first_time);
    my ($sec2,$min2,$hour2,$mday2,$mon2,$year2,$wday2,$yday2,$isdst2) = localtime($last_time);

    my $days1 = $year1 * 365 + $mon1 * 31 + $mday1;
    my $days2 = $year2 * 365 + $mon2 * 31 + $mday2;

    $days2 - $days1;
}

