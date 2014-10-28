#!/usr/bin/perl

# Generate data for boxplot of life expectancy for categories

use strict;
use warnings;

my $cat_id = 0;
my %category_id;
my %product_life;
my %lifes_per_category;

my $line;

&read_product_life_expectancy();

while ($line = <>) {
    chomp $line;
    my @cats;

    $line =~ /(\S+)\s+(.*)/;

    my $product_id = $1;
    my @categories = split /\s+/, $2;
    for (@categories) {
        my $c_id = get_cat_id($_);
        push @cats, $c_id;
    }

    if (exists $product_life{$product_id}) {
        my $cats_str = "@cats";
        print "$product_id $product_life{$product_id} @cats\n" if $cats_str =~ /31/;
        for (@cats) {
            push @{$lifes_per_category{$_}}, $product_life{$product_id};
        }
    } else {
        #print "prod $product_id does not have lifetime\n";
    }
}

for my $cat (sort keys %lifes_per_category) {
    my @lifes = @{$lifes_per_category{$cat}};
    next if (scalar @lifes) < 5;
    ###print "@lifes\n";
}

sub get_cat_id {
    my $category = shift;

    if (exists $category_id{$category}) {
        return $category_id{$category};
    } else {
        $category_id{$category} = $cat_id++;
    }
}

sub read_product_life_expectancy {
    open my $FILE, "<product_id_lifetime_average_score2" or die;

    while (<$FILE>) {
        /(\S+)\s+(.*)/;
#        print "$1 $2\n";
        $product_life{$1} = $2;
    }
}

