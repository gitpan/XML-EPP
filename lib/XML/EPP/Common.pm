
package XML::EPP::Common;

use Moose;
use MooseX::Method::Signatures;

# this file does not implement a document format or a node, so it
# doesn't consume the XML::EPP role.

use constant XSI_XMLNS => "http://www.w3.org/2001/XMLSchema-instance";

use Moose::Util::TypeConstraints;

our $PKG;
BEGIN {
	$PKG = "XML::EPP::Common";
}

#=====================================================================
#  eppcom-1.0.xsd mapping to types
#=====================================================================
# see EPP.pm, nearby, for introdutory explanatory notes

# this is a custom mapping.  Probably many of them will be for this
# class, as our normal definition of what to call the classes - based
# on the element name in which they are used - falls down completely;
# this spec for the most part defines types for use by the other
# standards.

use PRANG::XMLSchema::Types;
BEGIN{
	subtype "${PKG}::reasonBaseType"
		=> as "PRANG::XMLSchema::token"
		=> where {
			length($_) >= 1 and length($_) <= 32;
		};

	subtype "${PKG}::clIDType"
		=> as "PRANG::XMLSchema::token"
		=> where {
			length($_) >= 3 and length($_) <= 16;
		};
	subtype "${PKG}::labelType"
		=> as "PRANG::XMLSchema::token"
		=> where {
			length($_) >= 1 and length($_) <= 255;
		};

	subtype "${PKG}::minTokenType"
		=> as "PRANG::XMLSchema::token"
		=> where {
			length($_) >= 1;
		};

	subtype "${PKG}::roidType"
		=> as "PRANG::XMLSchema::token"
		=> where {
			m{^(?:[^\p{P}\p{Z}\p{C}]|_){1,80}-[^\p{P}\p{Z}\p{C}]{1,8}};
		};

	# XXX:
	# this doesn't work when I use it in XML::EPP::Domain::Tranfer::Response
	# Enum seems to work for attrs (see above) but not for elements.
	#enum "${PKG}::trStatusType" =>
	#	qw(clientApproved clientCancelled clientRejected pending
	#		serverApproved serverCancelled);

	# but this _does_ work when I use it in XML::EPP::Domain::Tranfer::Response
	subtype "${PKG}::trStatusType"
		=> as 'Str'
		=> where {
			m{^clientApproved|clientCancelled|clientRejected|pending|serverApproved|serverCancelled$};
		};
}

# allow any dateTime field to automatically coerce from timestamptz's
use MooseX::TimestampTZ;
coerce "PRANG::XMLSchema::dateTime"
	=> from "TimestampTZ"
	=> via {
		my $x = $_;
		$x =~ s{ }{T};
		$x =~ s{([+\-]\d{2})(\d{2})}{$1:$2};
		$x;
	};

use XML::EPP::Common::Reason;

# "AuthInfo" is usually introduced with a <pw> tag, so we'll call it
# Password
use XML::EPP::Common::Password;

# <ext>, but it's basically still a password.
use XML::EPP::Common::ExtPassword;

use XML::EPP::Common::Reason;

1;

=head1 NAME

XML::EPP::Common

=head2 SYNOPSIS

...

=head2 DESCRIPTION

...

=cut
