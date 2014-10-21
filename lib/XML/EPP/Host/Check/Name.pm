package XML::EPP::Host::Check::Name;

use Moose;
use PRANG::Graph;

with 'XML::EPP::Host::Node';

has_attr 'available' =>
	is => "ro",
	isa => "PRANG::XMLSchema::boolean",
	coerce => 1,
	xml_name => "avail",
	;

has_element "name" =>
	is => "ro",
	isa => "XML::EPP::Common::labelType",
	xml_nodeName => "",
	;

1;

=head2 XML Schema Definition

 <complexType name="checkNameType">
   <simpleContent>
     <extension base="eppcom:labelType">
       <attribute name="avail" type="boolean"
        use="required"/>
     </extension>
   </simpleContent>
 </complexType>

=cut
