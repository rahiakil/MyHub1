#!/usr/bin/perl

use strict;
use feature ":5.12";
use File::Path qw(make_path remove_tree);

exit main();

sub main
{
    my $dir = './papaprojects';

    opendir(DIR, $dir) or die $!;
    my $jobDir = './builds/jobs/';
    make_path($jobDir);

    while (my $file = readdir(DIR)) {

        # A file test to check that it is a directory
	# Use -f to test for a file
        next unless (-d "$dir/$file");
        
        next if ($file =~ m/^\./);

	print "$file\n";
	my $appParams = "ProjectName=$file\n" .
	    "ProjectRoot=./papaprojects/$file\n" .
	    "";
	my $fileName = $jobDir . $file . '.job';
	WriteFileText($fileName, $appParams) or die "Unable to write the params required\n";

    }
	
}

sub WriteFileText
{
    my ($filename, $text) = @_;

    if ($filename)
    {
        open(WFTFILE, ">$filename") or return;
        binmode(WFTFILE, ":utf8");
        print WFTFILE $text;
        close(WFTFILE);
        return 1;
    }
    return; #Fail
}

sub ReadFileText
{
    my ($filename) = @_;
    my $fileText;

    local $/ = undef;
    open(RFTFILE, "<$filename") or return;
    binmode(RFTFILE, ":utf8");
    $fileText = <RFTFILE>;
    close (RFTFILE);

    return $fileText;
}
