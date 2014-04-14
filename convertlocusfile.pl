#!/usr/bin/perl -w
###################################################################
#
# Name:	convertlocusfile.pl
#
# Description:
#   Converts old Relpair locus files to new ones
#   
# Parameters:
#   -h          show help
#   filename    locus file name (must end in .loc)
#
# Copyright (C) 2002, all rights reserved by Univ. of Michigan
###################################################################
use strict;
use File::Basename;
use Getopt::Long;

my($me, $mepath, $mesuffix) = fileparse($0, '.pl');
(my $version = '$Revision: 1.2 $ ') =~ tr/[0-9].//cd;

#--------------------------------------------------------------
#   Initialization - Sort out the options and parameters
#--------------------------------------------------------------
my %opts = ();
Getopt::Long::GetOptions( \%opts,qw(
    help
    )) || die "Failed to parse options\n";

#   Simple help if requested
if ($opts{help}) {
    print STDERR "$me [options] locusfile\n";
    print STDERR "Version $version\n";
    print STDERR "Converts Relpair locus files from old format to new format.\n";
    #print STDERR "More details available by entering: perldoc $0\n\n";
    #if ($opts{help}) { system("perldoc $0"); }
    exit 1;
}

#   If a filename is not provided, prompt for it
my $locfile;
unless (@ARGV) {
    print STDERR "Provide the locus name like 'relpair.loc' (enter=stop): ";
    $_ = <STDIN>;
    chomp;
    if ($_ eq '') { die "Aborting conversion process.\n"; }
    $locfile = $_;
}
else { $locfile = $ARGV[0]; }
my $newfile = $locfile . '.mod';

#---------------------------------------------#
#   Read (and write!) data in the same step   #
#---------------------------------------------#
#   Open the files
open(IN, $locfile) or die "Unable to read file '$locfile': $!\n";
open(OUT, ">$newfile") or die "Unable to write file '$newfile': $!\n";
while(<IN>) {
    #   check for well-formed locus file
    if ($. == 1 && $_ !~ /AUTOSOME|X-LINKED/) {
        my $phrase = "First line of locus file does not have proper keyword";
        $phrase .= " (AUTOSOME or X-LINKED)\nLooks instead like:\n'$_'";
        die $phrase;
    }
    if (/(.*)(AUTOSOME|X-LINKED)\s*(\d+)\s+0\s+(.*)/) {
        print OUT "$1 $2 $3  $4\n";
    } else { print OUT; }
}
close(OUT); 
close(IN);
print STDERR "\tConverted '$locfile' to '$newfile'\n";

#==================================================================
#   Perldoc Documentation
#==================================================================
__END__
