# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A description of an entity type.
    class EntityDescription < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :properties,
        :type_name,
        :doc_string,
        :supertype
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/entity_description'
      TYPE_MAP = {
        :supertype => Perka::Model::EntityDescription
      }

    end
  end
end