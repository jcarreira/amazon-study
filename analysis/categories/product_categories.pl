#!/usr/bin/perl

# Histogram of products lifetime

use strict;
use warnings;
use List::MoreUtils qw{uniq};

my $cat_id = 0;
my %category_id;

my $product_id = <>;
my @cats;
my $line;

while ($line = <>) {
    chomp $line;
    if ($line =~ /\s\s(.*)/) {
        my $c_id = get_cat_id($1);
        push @cats, $c_id;
    } else {
        @cats = uniq (sort @cats);
#        print "$product_id @cats\n";
        $product_id = $line;
        @cats = ();
    }
}

for my $category (sort keys %category_id) {
    print "$category ", $category_id{$category}, "\n";
}

sub get_cat_id {
    my $category = shift;

    my @tokens = split /,/, $category;
    $category = $tokens[0];

    $category = "unknown" unless defined $category;

    if (exists $category_id{$category}) {
        return $category_id{$category};
    } else {
        $category_id{$category} = $cat_id++;
    }
}

