#
#===============================================================================
#
#         FILE: Pwned.pm
#
#  DESCRIPTION: Check HIBP to see if this password has been pwned
#
#        FILES: ---
#         BUGS: ---
#        NOTES: https://haveibeenpwned.com/API/v2#PwnedPasswords
#       AUTHOR: Pete Houston (pete), cpan@openstrike.co.uk
# ORGANIZATION: Openstrike
#      VERSION: See $VERSION in code
#      CREATED: 29/05/18 14:44:30
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

package Password::Policy::Rule::Pwned;

use parent 'Password::Policy::Rule';

use Password::Policy::Exception::Pwned;
use Password::Policy::Exception::PwnedError;
use LWP::UserAgent;
use Digest::SHA 'sha1_hex';

our $VERSION = '0.00_01';
my $ua = __PACKAGE__ . '/' . $VERSION;
my $timeout = 5;
our $base_url = 'https://api.pwnedpasswords.com/range/';

sub check {
	my $self     = shift;
	my $password = $self->prepare (shift);
	my $hash     = uc sha1_hex ($password);
	my $range    = substr ($hash, 0, 5, '');
	my $url      = $base_url . $range;
	my $res      = LWP::UserAgent->new (agent => $ua, timeout => $timeout)->get ($url);
	if ($res->code != 200) {
		warn $res->status_line;
		Password::Policy::Exception::PwnedError->throw;
	}
	if (index ($res->content, "$hash:") > -1) {
		Password::Policy::Exception::Pwned->throw;
	}
	return 1;
}

__END__

=head1 NAME

Password::Policy::Rule::Pwned - Check passwords haven't been pwned

=head1 SYNOPSIS

	use Password::Policy;
	use Password::Policy::Rule::Pwned;
	use Try::Tiny;

	my $pass = 'password1';

	my $pp = Password::Policy->new (config => 'policy.yaml');
	try {
    	$pp->process({ password => $pass });
	} catch {
    	warn "This password '$pass' is pwned - don't use it";
		# Other actions
	}

=head1 DESCRIPTION

Plug this rule into L<Password::Policy> to validate potential passwords
against the list from L<api.pwnedpasswords.com>. It uses the recoomended
range function to ensure that neither the password nor its full hash is
ever transferred over the wire.

The Password::Policy configuration file should set the "pwned" attribute
to 1 in any policy where this rule should apply.

=head1 STATUS

B<This is alpha quality software.> It is not yet production ready.

=head1 SEE ALSO

To understand how to use this as part of a wider password policy
enforcement program, see L<Password::Policy>.

=head1 REPOSITORY

L<https://gitlab.com/openstrike/password-pwned>

=head1 MAINTAINER

This module is written and maintained by Pete Houston of Openstrike
<cpan@openstrike.co.uk>

=head1 COPYRIGHT INFORMATION
    
Copyright 2018 by Pete Houston. All Rights Reserved.

Permission to use, copy, and  distribute  is  hereby granted,
providing that the above copyright notice and this permission
appear in all copies and in supporting documentation.

=head1 LICENCE

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

