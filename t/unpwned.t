#
#===============================================================================
#
#         FILE: unpwned.t
#
#  DESCRIPTION: Check unpwned passwords
#
#       AUTHOR: Pete Houston (), cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: 1.0
#      CREATED: 29/05/18 16:55:47
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More;
use Test::Exception;
use Password::Policy;
use Password::Policy::Rule::Pwned;

my @pw = (
'#vC9\_=lxh|U%wG[n!Mh`]j#',
'(H0VHb!KSZ1?/y>3hmg=&&v/',
q#-qItBY5'gzlBFq8(Y$+ELN'f#,
'ô1«6é!`®ci²`?©mýDçâ,÷dl½'
);

if ($ENV{NO_NETWORK_TESTING}) {
	plan skip_all => 'NO_NETWORK_TESTING is set'
} else {
	plan tests => scalar @pw
}

my $pp = Password::Policy->new (config => 't/stock.yaml');
for my $pass (@pw) {
	lives_and { is $pp->process({ password => $pass }), $pass }
		"$pass is unpwned"
}
