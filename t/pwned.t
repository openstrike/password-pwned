#
#===============================================================================
#
#         FILE: pwned.t
#
#  DESCRIPTION: Try some pwned passwords
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Pete Houston (pete), cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: 1.0
#      CREATED: 29/05/18 15:52:08
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More;
use Test::Exception;
use Password::Policy;
use Password::Policy::Rule::Pwned;

my @pw = qw/ password password1 12345678 123456 /;
if ($ENV{NO_NETWORK_TESTING}) {
	plan skip_all => 'NO_NETWORK_TESTING is set'
} else {
	plan tests => scalar @pw
}

my $pp = Password::Policy->new (config => 't/stock.yaml');
for my $pass (@pw) {
	throws_ok { $pp->process({ password => $pass }) } qr/pwned/,
		"$pass is pwned as expected"
}

