use strict;
use warnings;
use 5.012;

my @search_results = ("page1.html", "page2.html", "page3.html");

foreach (@search_results)
{
	open my $fh, '<', $_ or die "Could not open '$_' $!\n";
 
	while (my $line = <$fh>) {
		chomp $line;
		if ($line =~ /Nintendo Switch :/g) {
			$line =~ s/^\s+|\s+$//g;
			print $line . "\n";
		}
	}
} 

