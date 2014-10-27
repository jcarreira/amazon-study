#!/usr/bin/perl

# Print prices

use strict;
use warnings;

my %product_price;

while (<>) {
    my @tokens = split /\s/;

    my $product = $tokens[0];
    my $price = $tokens[1];
    
    die unless defined $price;
    die unless defined $product;

    $price = -1 if $price eq "unknown";

    if (exists $product_price{$product}) {
        die unless $product_price{$product} == $price;
    } else {
        $product_price{$product} = $price;
    }
}

for my $key (keys %product_price) {
    next if $product_price{$key} == -1;
    print $product_price{$key}, "\n";
}

