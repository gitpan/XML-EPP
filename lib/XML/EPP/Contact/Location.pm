package XML::EPP::Contact::Location;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

with 'XML::EPP::Contact::Node';

has_attr 'type' =>
	is => 'ro',
	isa => 'XML::EPP::Contact::postalInfoEnumType',
	;

1;

=head2 XML Schema Definition

 <complexType name="intLocType">
   <attribute name="type" type="contact:postalInfoEnumType"
    use="required"/>
 </complexType>

=cut
