#!/usr/bin/perl


use strict;
use warnings;

my %product;

while (<>) {
    chomp;
    my @data = split / /, $_;

    my $prod_id = shift @data;

    #@{$product{$prod_id}}=() if not exists $product{$prod_id};
    if (not exists $product{$prod_id}) {
        @{$product{$prod_id}}=();
        print "$prod_id not exists\n";
    }
    print scalar(@{$product{$prod_id}}), " ";
    push \@data, @{$product{$prod_id}};
    print scalar(@{$product{$prod_id}});
    print " ", scalar @data,  " prod: $prod_id data: @data ", scalar @{$product{$prod_id}}, "\n";
}

print keys %product;

for my $key (keys %product) {
    my $l = scalar ($product{$key});
    print "$key $l\n";
}

