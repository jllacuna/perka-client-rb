# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a smartphone device associated with a specific Customer.
    class CustomerDevice < BaseEntityGlobal

      PROPERTY_NAMES = [
        :identifier,
        :admin,
        :customer,
        :model,
        :make,
        :os_version,
        :platform
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/customer'
      TYPE_MAP = {
        :customer => Perka::Model::Customer
      }

    end
  end
end