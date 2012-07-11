# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Merchants operate the retail locations that offer a Perka loyalty program.
    class Merchant < BaseEntityGlobal

      PROPERTY_NAMES = [
        :program_tiers,
        :visit_expiration_minutes,
        :merchant_state,
        :headline,
        :merchant_locations,
        :terms,
        :sales_demo,
        :name
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end