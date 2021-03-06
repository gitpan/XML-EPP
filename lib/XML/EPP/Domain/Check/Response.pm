package XML::EPP::Domain::Check::Response;

use Moose;
use PRANG::Graph;

sub root_element { 'chkData' }

with
        'XML::EPP::Domain::RS',
        'XML::EPP::Domain::Node',
        ;

use XML::EPP::Domain::Check::Status;

has_element 'items' =>
        is => 'ro',
        isa => 'ArrayRef[XML::EPP::Domain::Check::Status]',
        xml_nodeName => 'cd',
	required => 1,
        ;

1;

=head1 NAME

? - implement ?

=head1 SYNOPSIS

TODO

=head1 DESCRIPTION

...

=head2 XML Schema Definition

 <complexType name="chkDataType">
  <sequence>
    <element name="cd" type="domain:checkType"
     maxOccurs="unbounded"/>
  </sequence>
 </complexType>

=cut
