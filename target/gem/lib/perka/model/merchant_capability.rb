# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Describes a limitation placed upon a Merchant. This type associates a Merchant, 
    # a Type, and a integral count describing the actual limit.
    class MerchantCapability < BaseEntityGlobal

      PROPERTY_NAMES = [
        :type,
        :merchant,
        :count
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/merchant'
      require 'perka/model/type'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant,
        :type => Perka::Model::Type
      }

    end
  end
end