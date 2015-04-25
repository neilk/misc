#!/usr/bin/perl -w

use strict;

my @cmd = @ARGV;

my $t = 1;

while(1) {
  system(@cmd) or last;
  warn "sleeping $t seconds before retry...\n";
  sleep($t);
  $t *= 2;
}
