#!/usr/bin/perl
use strict;
use warnings;
use WWW::Mechanize ;
use Data::Dumper;


#slcl_bento_box_search
#Prepopulated Information
my $search_text ="Nintendo Switch";

#Create new WWW::Mechanize object
my $mech = WWW::Mechanize->new ;

#Fetch URL or Die Tryin'
$mech ->get("https://www.slcl.org/") ;
die $mech ->res->status_line unless $mech ->success ;

#Return list of forms found in the last fetched page to hand off to HTML::Form
my @webforms = $mech->forms();
#Examine each form 
my $frmCnt = 0;
foreach my $form (@webforms) {
	$frmCnt++;
	my @inputfields = $form->param;
    #print Dumper \@inputfields;
	#Examine each input field
	my $cnt = 0;
	foreach my $inputfield (@inputfields) {
		if($inputfield =~ /slcl_bento_box_search_select/) {
			$mech->set_fields( $inputfield => "search");
			print "found box: $inputfield" . "\n";
			$cnt++;
		} elsif ($inputfield =~ /slcl_bento_box_search/) {
			$mech->set_fields( $inputfield => $search_text);
			print "found box: $inputfield" . "\n";
			$cnt++;
		} 		
	}
	if ($cnt == 2) {
		print "found fields on form # $frmCnt\n";
		print "submitting ... \n";
		$mech ->submit ;
		print $form->dump . "\n";
		die $mech ->res->status_line unless $mech ->success ;
		# If the form sends you somewhere, you can catch it :
		my $new_url = $mech ->response->request->uri->as_string ;
	}

}

