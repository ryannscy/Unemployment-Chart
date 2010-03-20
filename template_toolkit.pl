#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  template_toolkit.pl
#
#        USAGE:  ./template_toolkit.pl  
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
#      CREATED:  03/17/2010 14:23:00
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;


#!/usr/bin/perl
use strict;
use warnings;
use Template;
my $tt = Template->new;
open TEAMS, "+<", "teams.rtf" or die $!;

#$tt->process('my_template',\%data) || die $tt->error;

#my %data = ( name => 'English Premier League',
    #season => '2000/01',
    #teams => \@teams);

#my @teams = ( 
    #{name =>'Manchester United',
        #played =>16,
        #won =>12,
        #drawn =>3,
        #lost =>1},
        #{ name =>'Bradford',
        #played =>16,
        #won=>2,
        #drawn =>5,
        #lost =>9});


my @cols = qw(name hw hd h1 hf ha aw ad al af aa);

my @teams;
while(<TEAMS>) {
    chomp;
    
my %teams;
@teams{@cols} = split/,/;
    
push @teams, \%teams;
}


foreach (@teams){
    $_->{w} = $_->{hw} + $_->{aw};
    $_->{d} = $_->{hd} + $_->{ad};
    $_->{1} = $_->{h1} + $_->{a1};

    $_->{pl} = $_->{w} + $_->{d} + $_->{1};

    $_->{gd} = $_->{f} - $_->{a};
    $_->{pt} = (3 *$_->{w} ) + $_->{d};

}


@teams = sort{
$b->{pt} <=> $b->{pt} || $b->{gd} <=> $a->{gd}
} @teams;

$teams[$_]->{pos} = $_ + 1
foreach 0 .. $#teams; 



