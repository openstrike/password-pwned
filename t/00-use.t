#
#===============================================================================
#
#         FILE: 00-use.t
#
#  DESCRIPTION: Can we use it
#
#       AUTHOR: Pete Houston (), cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: 0.0
#      CREATED: 29/05/18 15:34:18
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests => 3;

BEGIN {
	use_ok ('Password::Policy::Exception::Pwned');
	use_ok ('Password::Policy::Rule::Pwned');
}

is ($Password::Policy::Rule::Pwned::VERSION, '0.00_02', 'Version');
