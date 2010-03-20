#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  umemploymentchart.pl
#
#        USAGE:  ./umemploymentchart.pl  
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Amiri Barksdale (), 
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  03/18/2010 20:44:22
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;


#!/usr/bin/perl
use strict;
use warnings;
use Chart::Clicker;
use Chart::Clicker::Data::Series;
use Chart::Clicker::Data::DataSet;
use Template;

while (<>){

    
#open UNEMPLOY, "+<", "<>" or die $!;


my $cc = Chart::Clicker->new(width =>2200, height=> 500, format=> 'png');

$cc->title->text('Unemployement Chart');
$cc->title->font->size(12);


my @years;
my @rates;
my @array;
my @raw_data = <>;

#print "@data\n";

foreach my $data (@raw_data) {
    chomp($data);

    # print "$data\n";
    $data =~ s/"//g;

        # print "$data\n";
    my @data_array = split( ',', $data );
    $data_array[0] =~ s/-/\./g;
    #print " $data_array[0]   $data_array[1]\n";
    push( @array, \@data_array );
    push( @years, $data_array[0] );
    push( @rates, $data_array[1] );

}


#print "@years \n";
#print "@rates\n";



my $series1 = Chart::Clicker::Data::Series->new(
    keys => \@years,
