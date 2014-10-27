#!/usr/bin/perl

# Histogram of products lifetime

use strict;
use warnings;

my %user_first_review;
my %user_last_review;
my %user_reviews;

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

    $user_reviews{$userId}++;
    next if $time == -1;

    # if first timestamp make it as beginning
    if (not exists $user_first_review{$userId}) {
        $user_first_review{$userId} = $time;
        $user_last_review{$userId} = $time;
    } else {
        # check that entries are ordered by timestamp
        # die if ($user_first_review{$userId} > $time);
        if ($user_first_review{$userId} > $time) {
            $user_first_review{$userId} = $time;
        }
       

        if ($time > $user_last_review{$userId}) {
            $user_last_review{$userId} = $time;
        }
    }
}

for my $key (keys %user_first_review) {
    my $first_time = $user_first_review{$key};
    my $last_time = $user_last_review{$key};
    my $total_time = $last_time - $first_time;
   
    my ($sec1,$min1,$hour1,$mday1,$mon1,$year1,$wday1,$yday1,$isdst1) = localtime($first_time);
    my ($sec2,$min2,$hour2,$mday2,$mon2,$year2,$wday2,$yday2,$isdst2) = localtime($last_time);

    my $diff_days = calc_diff_days($first_time, $last_time);

    #print scalar localtime($user_first_review{$key}), " ", scalar localtime($user_last_review{$key}), "\n"; 
    #print $year2 - $year1, " ", $mon2-$mon1, " ", $mday2-$mday1, "\n";
    #print $year2, " ", $year1, " ", $mon2-$mon1, " ", $mday2-$mday1, "\n";
    #print "diff_days: $diff_days\n";
#
#    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($total_time);
    #print $user_last_review{$key}, " ", $user_first_review{$key}, "\n";
#
    #print "$key $diff_days\n" if ($diff_days != 0);

    # I consider a user dead if no review happens for 3 years
    next if ($year2 > 2010);
    #next if ($user_product_reviews{$key} < 50);

    print "$key $diff_days\n" if ($diff_days != 0);
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

