# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A description of an entity type.
    class EntityDescription < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :supertype,

        # Indicates that instance of the the type may be persisted by the server. 
        # This hint can be used to reduce payload sizes by transmitting only mutated 
        # properties.
        :persistent,
        :doc_string,
        :properties,
        :type_name
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/entity_description'
      TYPE_MAP = {
        :supertype => Perka::Model::EntityDescription
      }

    end
  end
end