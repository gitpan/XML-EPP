
package XML::EPP::Domain::Renew;

use Moose;
use PRANG::Graph;

sub root_element { 'renew' }

with 'XML::EPP::Domain::RQ', 'XML::EPP::Domain::Node';

has_element 'name' =>
	is => 'ro',
	isa => 'XML::EPP::Common::labelType',
	;

has_element 'expiry_date' =>
	is => 'ro',
	isa => 'PRANG::XMLSchema::date',
	xml_nodeName => 'curExpDate',
	;

use XML::EPP::Domain::Period;
has_element 'period' =>
	is => 'ro',
	isa => 'XML::EPP::Domain::Period',
	;

1;

=head2 XML Schema Definition

<!--
Child elements of the <renew> command.
-->
<complexType name="renewType">
 <sequence>
   <element name="name" type="eppcom:labelType"/>
   <element name="curExpDate" type="date"/>
   <element name="period" type="domain:periodType"
    minOccurs="0"/>
 </sequence>
</complexType>

=cut
