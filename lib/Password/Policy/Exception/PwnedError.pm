#
#===============================================================================
#
#         FILE: PwnedError.pm
#
#  DESCRIPTION: Throw an exception for failure to check pwned password
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Pete Houston, cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: See $VERSION in code
#      CREATED: 18/07/18 14:53:15
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

package Password::Policy::Exception::PwnedError;
 
use parent 'Password::Policy::Exception';

our $VERSION = '0.00_01';

sub error { return 'Invalid response checking for pwned password'; }

1;
