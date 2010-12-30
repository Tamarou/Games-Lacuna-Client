#!/usr/bin/perl 
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Getopt::Long qw(GetOptions);

use Data::Dumper;
use Games::Lacuna::Client::Market;
use List::MoreUtils qw(any);

$| = 1;

my $show_color = 0;
my $use_sst = 0;
my $planet = '';
my @filters = ();
my @sorts = ();
my $sort_descending = 0;
my $max_pages = 20;

GetOptions(
    'help'      => \&show_usage,
    'sst'       => \$use_sst,
    'color'     => \$show_color,
    'planet=s'  => \$planet,
    'filter=s'  => \@filters,
    'sort=s'    => \@sorts,
    'desc'      => \$sort_descending,
    'max-pages=n' => \$max_pages
);

sub show_usage{
print << '__END_USAGE__';
Usage:  perl available_trades.pl [options]
    
This script will pull the list of available trades from a trade ministry or
subspace transporter, optionally filter and sort it, and present it in a
single list, optionally with ANSI color-coding.

WARNING: This trade will make up to --max_pages requests for available trades,
running it repeatedly could be expensive in terms of RPC calls.

Valid options:
  --help           Show this usage message.
  --max-pages <n>  Pull at most <n> pages from the building.  Default=20.
  --color          Show ANSI colors.
  --sst            Show trades at the subspace transporter rather than 
                   the trade ministry (trade ministry is default).
  --planet         specify the planet (by name) to use for the listing.
                   If not specified, the script scans your empire for
                   a planet with a suitable building.
__END_USAGE__
exit(0);
}

my $cfg_file = shift(@ARGV) || 'lacuna.yml';
unless ( $cfg_file and -e $cfg_file ) {
	die "Did not provide a config file";
}

my $market = Games::Lacuna::Client::Market->new(
  cfg_file => $cfg_file,
  building => ($use_sst ? 'Transporter' : 'Trade'),
  call_limit => $max_pages,
  planet_name => $planet,
);

use Perl6::Form;

my @trades = $market->available_trades;

print
    "Empire         cost offering\n\n";
for my $trade (@trades){
  my $empire = $trade->empire;
  my $cost = $trade->cost;
  my @offer = map{
      $_->type eq 'ship'
    ? $_->ship_type
    : $_->desc
  } $trade->offer;
  print form(
    '{<<<<<<<<<<<<<} {>} {[[[{40}[[[}',
    $empire, $cost, \@offer,
  );
}

