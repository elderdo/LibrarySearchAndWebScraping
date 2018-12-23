use WWW::Mechanize;
use strict;
use warnings;
my $mech = WWW::Mechanize->new;

my $sequence = '...';

$mech->get('https://www.slcl.org/');
$mech->submit_form(
  form_number => 3,
  fields => {
    'slcl_bento_box_search' => 'Nintendo Switch',
  },
);

my $result = $mech->content;
print "$result" . "\n";
while ($result =~ /(Nintendo Switch : [^<]+)/g) {
	print $1 . "\n";
}

