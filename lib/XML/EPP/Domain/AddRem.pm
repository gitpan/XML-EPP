package XML::EPP::Domain::AddRem;

use Moose;
use PRANG::Graph;
with 'XML::EPP::Domain::Node';

use PRANG::XMLSchema::Types;

has_element 'ns' =>
	is => 'rw',
	isa => 'XML::EPP::Domain::NS',
	required => 0,
	;

has_element 'contact' =>
	is => 'rw',
	isa => 'ArrayRef[XML::EPP::Domain::Contact]',
	xml_min => 0,
	;

has_element 'status' =>
	is => 'rw',
	isa => 'ArrayRef[XML::EPP::Domain::Status]',
	xml_min => 0,
	xml_max => 11,
	;

1;

=head2 XML Schema Definition

<!--
Data elements that can be added or removed.
-->
<complexType name="addRemType">
 <sequence>
   <element name="ns" type="domain:nsType"
    minOccurs="0"/>
   <element name="contact" type="domain:contactType"
    minOccurs="0" maxOccurs="unbounded"/>
   <element name="status" type="domain:statusType"
    minOccurs="0" maxOccurs="11"/>
 </sequence>
</complexType>

=cut
