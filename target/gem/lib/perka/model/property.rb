# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # An immutable view of a property that should be serialized.
    class Property < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [

        # Returns the json payload name of the Property, which may differ from the 
        # bean name if a JsonProperty annotation has been applied to the getter.
        :name,

        # A simplified description of the property's type.
        :type,
        :doc_string,

        # The payload name of the type that defines the property.
        :enclosing_type_name,

        # Returns the role names that are allowed to get the property. A value containing 
        # a single asterisk means that all roles may access the property.
        :getter_role_names,

        # When a new value is assigned to the current property in some instance, 
        # the implied property of the new value should also be updated with the 
        # current instance.
        :implied_property,

        # Return the role names that are allowed to set this property. A value containing 
        # a single asterisk means that all roles may set the property.
        :setter_role_names,

        # Returns <code>true</code> if the Property should be included only during 
        # a deep traversal.
        :deep_traversal_only,

        # Returns <code>true</code> if an entity Property's properties should be 
        # emitted into the owning entity's properties.
        :embedded,

        # Returns <code>true</code> if the referred entity's owner should also be 
        # considered an owner of the entity that defines the Property.
        :inherit_principal,

        # If <code>true</code>, non-null properties that contain the property type's 
        # default value will not be serialized. For example, integer properties 
        # whose values are <code>0</code> will not be serialized.
        :suppress_default_value
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/type'
      require 'perka/model/property'
      TYPE_MAP = {
        :type => Perka::Model::Type,
        :implied_property => Perka::Model::Property
      }

    end
  end
end