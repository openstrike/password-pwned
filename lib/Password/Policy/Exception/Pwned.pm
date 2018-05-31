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
#      VERSION: 1.0
#      CREATED: 29/05/18 14:42:12
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
 
use parent 'Password::Policy::Exception';

sub error { return 'This password has been pwned'; }

1;
