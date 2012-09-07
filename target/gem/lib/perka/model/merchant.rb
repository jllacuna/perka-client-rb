# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Merchants operate the retail locations that offer a Perka loyalty program.
    class Merchant < BaseEntityGlobal

      PROPERTY_NAMES = [
        :name,
        :last_action_at,
        :visit_expiration_minutes,
        :program_tiers,
        :merchant_state,
        :sales_demo,
        :headline,
        :merchant_capabilities,
        :merchant_locations,
        :merchant_users,
        :notes,
        :terms
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end