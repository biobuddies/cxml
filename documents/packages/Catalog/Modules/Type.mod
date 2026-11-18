<!--
    For cXML license agreement information, please see
    http://www.cxml.org/home/license.asp

    $Id$
-->

<!-- 
   This module defines several elements used to construct Type definitions
   describing parametric catalog item data. These elements are intended
   to replace the deprecated SearchGroup and SearchGroupAttribute element
   definitions. These elements provide a richer and more general framework
   for defining parametric Types, and they allow the definition/standardization
   of parametric Types from a TypeProvider organization independent of the
   Index data in which the current SearchGroup elements are.

   Note that the SearchGroupData and SearchDataElement element definitions
   are used to specify the actual parametric data for a given catalog item.
   The SearchGroupData element must reference a known, defined Type, and
   the SearchDataElement elements are used to specific data for each
   TypeAttribute within that Type.
-->
<!ELEMENT TypeDefinition (TypeProvider, Comments?, (PrimitiveType | Type)+)>

<!--
   The provider of these type definitions, identified by a name and one
   or more ID's, for example, NetworkID AN001001001, or DUNS 444455556.

   Note the required name attribute and the optional list of Name
   children. The optional list is for localized display purposes,
   allowing different names to be provided per locale. The name
   attribute is the "canonical" name used to reference the type
   provider when fully qualifying the name of a type (for example, 
   in a SearchGroupData element reference). See Type element for 
   more information on Type naming.
-->
<!ELEMENT TypeProvider (Name*, OrganizationID)>
<!--
	@attr name Name of the type provider.
-->
<!ATTLIST TypeProvider
    name    %string; #REQUIRED
>

<!--
   A Type is a named element containing one or more TypeAttributes. A
   Type may "extend" (or "derive from") another Type, thus inheriting
   its parents TypeAttributes. There is one important distinction
   between Type inheritance and a normal OO inheritance model: child
   TypeAttributes may *not* override parent TypeAttributes. It is
   considered illegal to define a TypeAttribute of the same name as
   a parent TypeAttribute.

   Type descriptions may be provided in multiple locales through the
   optional Description child element list. The ShortName element
   within that Description should be used to provide an alternative
   locale specific name for the Type. The required name attribute
   should be used within the SearchGroupData element to reference
   a given Type.

   A Type name is always scoped by a TypeProvider name, allowing for
   the existence of multiple Type taxonomies. Applications should
   respect a short-hand notation for a fully-qualified type name
   outside a defined TypeProvider scope of the form:
   %
            "TypeProviderName:TypeName"
   %
   For example, if an organization named "UNSPSC" provides a type definition
   called "Pipe" which defines the parametric attributes of a Pipe,
   that Pipe Type would be referenced as "UNSPSC:Pipe" when referenced
   in a SearchGroupData name.
-->
<!ELEMENT Type (Name*, Description*, TypeAttribute*)>
<!--
	@attr name Name of the type.

	@attr extends Type that this Type extends and from which it 
		inherits TypeAttributes.
-->
<!ATTLIST Type
    name    %string; #REQUIRED
    extends %string; #IMPLIED
>

<!--
    An attribute within a Type. The Name attribute is required and is the name
    used in the SearchDataElement element. The optional Name element children
    may be used to provide locale-specific alternative names for this attribute.

    TypeAttributes themselves are of a named type, as indicated by the "type"
    attribute. The name may be another Type, or a PrimitiveType.
-->
<!ELEMENT TypeAttribute (Name*, Description*, (EnumerationValue+ | Range)?, Extrinsic*)>
<!--
    @attr name Name used in the SearchDataElement element.
	
	@type type The named type of the attribute. It may refer to another Type, or a PrimitiveType.

    @attr shortTag Alias for attribute, reserved for future use.

    @attr mappedFrom For fields that are defined implicitly from other objects in
		the system specify location.

    @attr isRequired Indicates whether a (non-empty) value for the given attribute
		is required.

    @attr isRefinable Indicates whether the given attribute is refinable in search
		queries. All refinable attributes are currently indexed.

    @attr isRequiredForOrdering Indicates that the value for an attribute must be 
		provided as part of an order sent to the supplier

    @attr isSearchable Indicates whether the given attribute is searchable in search
		queries. All searchable Attributes are currently indexed.

    @attr isCollection Indicates whether repeating values are allowed for the given
		attribute

    @attr isCaseSensitive Indicates whether case should be preserved for the given
		attribute. This property only applies to attributes of type string
        or literal. It has no effect on numeric, boolean, or date
        attributes, nor does it apply to attributes of complex type.

    @attr isInKey Indicates whether the given attribute should be considered part
		of the unique key for the type.

    @attr isInFreeTextSearch Indicates whether the given attribute value should be indexed
		to be a candidate in a free-text (All) query.

    @attr isHidden Indicates whether or not this attribute is displayable to a user.

    @attr isSortable Indicates if this attribute can be sorted.

    @attr isReadOnly Indicates if the value is frozen and can't be changed by the
		receiving application.

    @attr unit Optional string indicating the unit of the given attribute, if
		applicable. For example, if the TypeAttribute is of a PrimitiveType
        with a scalar type of "integer", this unit might be "IN" to
        indicate inches.
-->
<!ATTLIST TypeAttribute
    name                  %string;        #REQUIRED
    type                  %string;        #REQUIRED
    shortTag              %string;        #IMPLIED
    mappedFrom            %string;        #IMPLIED
    isRequired            (yes)           #IMPLIED
    isRequiredForOrdering (yes)           #IMPLIED
    isRefinable           (yes)           #IMPLIED
    isSearchable          (yes)           #IMPLIED
    isCollection          (yes)           #IMPLIED
    isCaseSensitive       (yes)           #IMPLIED
    isInKey               (yes)           #IMPLIED
    isInFreeTextSearch    (yes)           #IMPLIED
    isHidden              (yes)           #IMPLIED
    isSortable            (yes)           #IMPLIED
    isReadOnly            (yes)           #IMPLIED
    unit                  %string;        #IMPLIED
>

<!--
   EnumerationValue allows one to specify a set of one or more
   valid data values for the given TypeAttribute.
-->
<!ELEMENT EnumerationValue ANY>

<!--
   Range allows one to specify a range of valid data values for a
   given TypeAttribute
-->
<!ELEMENT Range (RangeBegin, RangeEnd)>

<!--
	Specifies the beginning of a range.
-->
<!ELEMENT RangeBegin ANY>
<!--
	@attr inclusive Set to "yes" to indicate that the range includes the beginning value.
-->
<!ATTLIST RangeBegin
    inclusive           (yes)          #IMPLIED
>

<!--
	Specifies the end of a range.
-->
<!ELEMENT RangeEnd ANY>
<!--
	@attr inclusive Set to "yes" to indicate that the range includes the ending value.
-->
<!ATTLIST RangeEnd
    inclusive           (yes)          #IMPLIED
>

<!-- scalarType entity -->
<!ENTITY % scalarType "(integer | string | literal | double | date | boolean)">

<!--
   A named scalar type. These types can be thought of as re-usable building 
   blocks for defining simple TypeAttributes, for example, a string of length 
   255, and so on.
-->
<!ELEMENT PrimitiveType (Description?)>
<!--
	@attr name Name of the primitive type.
	
	@attr type The named scalar type. Possible values: "integer", "string", "literal", 
		"double", "date", and "boolean".
		
	@attr min Optional attribute indicating the minimum length for
		a TypeAttribute of scalarType "string" or "literal".

	@attr max Optional attribute indicating the maximum length for
		a TypeAttribute of scalarType "string" or "literal".

	@attr maxPrecision Optional attribute indicating the maximum precision for
		a TypeAttribute of scalarType "double".

	@attr maxScale Optional attribute indicating the maximum scale for
		a TypeAttribute of scalarType "double".
-->
<!ATTLIST PrimitiveType
    name            %string;        #REQUIRED
    type            %scalarType;    #REQUIRED
    min             %string;        #IMPLIED
    max             %string;        #IMPLIED
    maxPrecision    %string;        #IMPLIED
    maxScale        %string;        #IMPLIED
>
