use ExtUtils::MakeMaker;
use strict;
use warnings;
require 5.6.0;


my %MF = (
	NAME      =>   "Password::Policy::Rule::Pwned",
	ABSTRACT  =>   "Compare text to known pwned passwords list",
	AUTHOR    =>   'Pete Houston (cpan@openstrike.co.uk)',
	LICENSE         => 'perl',
	META_MERGE => {
		'meta-spec' => { version => 2 },
		resources   => {
			bugtracker => {
				web => 'http://rt.cpan.org/Public/Dist/Display.html?Name=Password-Policy-Rule-Pwned'
			},
			repository => {
				type => 'git',
				url  => 'git://github.com/openstrike/password-pwned.git',
				web  => 'https://github.com/openstrike/password-pwned',
			}
		}
	},
	MIN_PERL_VERSION    => '5.6.0',
	PREREQ_PM       =>  {
		'LWP' => '6.00',
		'Digest::SHA' => '0',
	},
	TEST_REQUIRES => {
		'Test::More'	=> '0',
	},
	VERSION_FROM    => 'lib/Password/Policy/Rule/Pwned.pm',
   	'dist'    =>   {
		COMPRESS => 'gzip -9f', 
		SUFFIX   => 'gz'
   	}
);

if ($ExtUtils::MakeMaker::VERSION lt 6.64) {
	if ($ExtUtils::MakeMaker::VERSION ge 6.55) {
		$MF{BUILD_REQUIRES} = $MF{TEST_REQUIRES};
	}
	delete $MF{TEST_REQUIRES};
}
if ($ExtUtils::MakeMaker::VERSION lt 6.55) { delete $MF{BUILD_REQUIRES};   }
if ($ExtUtils::MakeMaker::VERSION lt 6.48) { delete $MF{MIN_PERL_VERSION}; }
if ($ExtUtils::MakeMaker::VERSION lt 6.46) { delete $MF{META_MERGE};       }
if ($ExtUtils::MakeMaker::VERSION lt 6.31) { delete $MF{LICENSE};          }
WriteMakefile (%MF);

print <<End_of_Text;

Now do the following to install Password::Policy::Rule::Pwned:

    % make
    % make test
    % make install

End_of_Text
