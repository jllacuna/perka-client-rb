# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A simple JSON type description.
    class Type < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :enum_values,
        :json_kind,
        :list_element,
        :map_key,
        :map_value,
        :type_hint,
        :name
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/type'
      require 'perka/model/type'
      require 'perka/model/type'
      TYPE_MAP = {
        :map_key => Perka::Model::Type,
        :list_element => Perka::Model::Type,
        :map_value => Perka::Model::Type
      }

    end
  end
end