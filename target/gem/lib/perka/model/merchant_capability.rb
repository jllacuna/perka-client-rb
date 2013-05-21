# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Describes a limitation placed upon a Merchant. This type associates a Merchant, 
    # a Type, and a integral count describing the actual limit.
    class MerchantCapability < BaseEntityGlobal

      PROPERTY_NAMES = [
        :merchant
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant
      }

    end
  end
end