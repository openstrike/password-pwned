#
#===============================================================================
#
#         FILE: Pwned.pm
#
#  DESCRIPTION: Throw an exception for a pwned password
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Pete Houston, cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: See $VERSION in code
#      CREATED: 29/05/18 14:42:12
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

package Password::Policy::Exception::Pwned;
 
use parent 'Password::Policy::Exception';

our $VERSION = '0.00_02';

sub error { return 'The specified password has been pwned'; }

1;
