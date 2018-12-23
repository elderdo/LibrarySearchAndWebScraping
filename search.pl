# After doing query for "Nintendo Search" and examining
# the first returned page and its "See More" link
# discovered that the search engine generates a url
# with search criteria.
# It then returns the first page of the results with "next"
# hyperlinked text, which contains the continuation of the
# search with partial url, that when appended to the server's
# search engine it continues the search.  This continues until
# the final page does not have a hyperlinked "next".
use strict;
use warnings;

use LWP::Simple;
# start the search
my $contents = get(
"http://encore.slcl.org/iii/encore/search?target=Nintendo Switch");

do {
	# go through the returned text and extract "all" matching
	# results 
	while ($contents =~ /(Nintendo\s+Switch :.*)/g) {
		print $1 . "\n";
	}
	# if there is a link for the text "next"
	# append it to the server's search engine
	# after finding href=" get all the characters that are
	# not a double quote followed by ">next<
	if ($contents =~ /href="([^"]+)">next</) {
	
		# get the next page using the matched text between
		# the paren's i.e. the next search url for the next page
		$contents = get("http://encore.slcl.org" . $1);
		
	} else {
	
		# no hyperlinked "next" so we're done
		$contents = "";
	}
	
	# keep going as long as $contents is not equal to
	# an empty string
} while ($contents ne "");



