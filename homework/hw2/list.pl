#!/usr/bin/perl -w
                 
# Author:   Steven lo
# Date  :  19 Sep 2009
# Program Name: list 
 
# Prints range(s) of text file lines to standard output.  If no range(s) specified, prints entire file.
 
# When invoked with -n option, prepends line(s) with line number(s).

#-----------------------------------------------------------------------------#

use strict;
 
use Getopt::Std;
 
die "usage: list <-n> <line-range> filename\n" if not @ARGV;

my @ARGV_reverse = reverse(@ARGV);

my $filename = $ARGV_reverse[0];

die "invalid filename:  $filename\n" if not (-e $filename);
die "$filename is not a text file\n" if not (-T $filename);

my $range_arg;

if ( (not $ARGV_reverse[1]) or ($ARGV_reverse[1] =~ m/^-[n]$/) )
{
  $range_arg = '1-$';
}
elsif ($ARGV_reverse[1] =~ m/^([-\$0-9]+,)*[-\$0-9]+$/)
{
  $range_arg = $ARGV_reverse[1];
}
else
{
  die "invalid range:  $ARGV_reverse[1]";
}

my %opts;

getopt('n', \%opts);

my %ranges;
my $range_num;

foreach my $range (split(m/,/, $range_arg, -1))
{
  $range_num++;

  $range =~ s/^-/1-/;
  $range =~ s/-$/-\$/;
  $range =~ s/^(\d+)$/$1-$1/;
  $range =~ s/^\$$/\$-\$/;

  my ($beg_line, $end_line) = split(m/-/, $range);

if ( ($beg_line eq '$' and $end_line ne '$') or ($end_line ne '$' and $beg_line gt $end_line) )
  {
    ($beg_line,$end_line) = ($end_line,$beg_line);

    $ranges{$range_num} = 
    {
      beg_line => $beg_line,
      end_line => $end_line,
      array => [],
      reverse => 1
    };
  }
  else
  {
    $ranges{$range_num} = 
    {
      beg_line => $beg_line,
      end_line => $end_line,
      array => [],
      reverse => 0
    };
  }
}
  
open(INPUT, '<', $filename) or die $!;

my $line;
my $prev_line;
my $linenum = 0;

if (exists $opts{n})
{
  while ($line = <INPUT>)
  {
    $linenum++;
  
    my $linenum_str = $linenum . '';

    $line = $linenum_str . " " x (8-length($linenum_str)) . $line;
  
    foreach my $key (keys %ranges)
    {
      if ( ($ranges{$key}{beg_line} ne '$' and ($ranges{$key}{beg_line} + 0) <= $linenum) and
           ($ranges{$key}{end_line} eq '$' or ($ranges{$key}{end_line} + 0) >= $linenum) )
      {
        push @{$ranges{$key}{array}}, $line;
      }
    }

    $prev_line = $line;
  }

  if ($prev_line)
  {
    foreach my $key (keys %ranges)
    {
      if ($ranges{$key}{beg_line} eq '$' and $ranges{$key}{end_line} eq '$')
      {
        push @{$ranges{$key}{array}}, $prev_line;
      }
    }
  }
}
else
{
  while (my $line = <INPUT>)
  {
    $linenum++;
  
    foreach my $key (keys %ranges)
    {
      if ( ($ranges{$key}{beg_line} ne '$' and ($ranges{$key}{beg_line} + 0) <= $linenum) and
           ($ranges{$key}{end_line} eq '$' or ($ranges{$key}{end_line} + 0) >= $linenum) )
      {
        push @{$ranges{$key}{array}}, $line;
      }
    }
  
    $prev_line = $line;
  }

  if ($prev_line)
  {
    foreach my $key (keys %ranges)
    {
      if ($ranges{$key}{beg_line} eq '$' and $ranges{$key}{end_line} eq '$')
      {
        push @{$ranges{$key}{array}}, $prev_line;
      }
    }
  }
}

foreach my $key (sort { $a <=> $b } (keys %ranges))
{
  if ($ranges{$key}{reverse} == 1)
  {
    print reverse(@{$ranges{$key}{array}});
  }
  else
  {
    print @{$ranges{$key}{array}};
  }
}
