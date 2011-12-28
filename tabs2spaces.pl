#!/usr/bin/perl
# intended to be invoked from within vim
my $tabstop = @ARGV[0] || 2;
my $spaces = " " x $tabstop;
while (<>) {
  s/\t/$spaces/g;
  print;
}
