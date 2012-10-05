# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a customer's preference to have a specific social event posted 
    # to a specific social backend.
    class SocialServiceSubscription < BaseEntityGlobal

      PROPERTY_NAMES = [
        :customer,
        :social_service,
        :social_action
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/customer'
      TYPE_MAP = {
        :customer => Perka::Model::Customer
      }

    end
  end
end