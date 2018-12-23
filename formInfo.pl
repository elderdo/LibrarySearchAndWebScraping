use strict;
use warnings;

use WWW::Mechanize;

my $m = WWW::Mechanize->new();
$m->get("https://www.slcl.org/");
my $count = 1;
for my $form ($m->forms) {
    print "form $count fields are:\n";
    $count++;
    for ($form->param) {
        printf "%s - %s\n", $_, $form->value($_);
    }
    print "\n";
}