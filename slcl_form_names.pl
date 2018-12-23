use strict;
use warnings;
use WWW::Mechanize;
use Data::Dumper;

my $mech = WWW::Mechanize->new();

my $url = "https://www.slcl.org/";

$mech->get($url);

my @forms = $mech->forms;

foreach my $form (@forms) {

        my @inputfields = $form->param;

        print Dumper \@inputfields;
}  
