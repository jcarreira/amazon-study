#!/usr/bin/perl

# Histogram of products lifetime

use strict;
use warnings;

my %product_first_review;
my %product_last_review;
my %number_product_reviews;

my %product_review_score;

my %product_categories;
&read_product_category();

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

    $product_review_score{$productId} += $score;
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
    #print "diff_days: $diff_days\n";
#
#    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($total_time);
    #print $product_last_review{$key}, " ", $product_first_review{$key}, "\n";
#
    next if ($year2 > 110);
    next if ($number_product_reviews{$key} < 50);
    #print "$key $diff_days\n" if ($diff_days != 0);
    my $average_score = $product_review_score{$key} / $number_product_reviews{$key};

    # if ($diff_days == 6444) {
    #     print scalar localtime($first_time), " ", scalar localtime($last_time), " $year1 $year2\n";
    #     die;
    # }
    my $cats_str = "@{$product_categories{$key}}";
    $cats_str =~ s/\s+/-/;

    print "$key $diff_days $average_score $cats_str\n" if ($diff_days != 0);
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

sub read_product_category() {
    open my $FILE, "<../categories/product_categories3" or die;

    while (<$FILE>) {
        /(\S+)\s+(.*)/;
        push @{$product_categories{$1}}, $2;
    }
    close $FILE;
}

