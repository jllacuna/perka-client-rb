# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a mapping between full URL's, and their shortened counterparts
    class ShortLink < BaseEntityGlobal

      PROPERTY_NAMES = [
        :entity,
        :short_url,
        :full_url
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/base_entity_global'
      TYPE_MAP = {
        :entity => Perka::Model::BaseEntityGlobal
      }

    end
  end
end