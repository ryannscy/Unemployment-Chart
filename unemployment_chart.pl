#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  unemployment_chart.pl
#
#        USAGE:  ./unemployment_chart.pl
#
#  DESCRIPTION:
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Ryann Scypion (), ryann@metalabel.com
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  03/11/2010 09:13:12 PM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;

open UNEMPLOY, "+<", "unemploy.csv" or die $!;
my @s;
my @data = <UNEMPLOY>;

#print "@data\n";

foreach my $d (@data) {
    chomp($d);

    #print "$d\n";
    $d =~ s/"//g;

    # print "$d\n";
    my @dd = split( ',', $d );
    print $dd[0];
     
push (@s,\@dd);
}

print "@s\n";


print "+++++++++++++++++++++++++++++++++++++++++++++++++++++\n";

