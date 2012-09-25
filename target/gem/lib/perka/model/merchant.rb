# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Merchants operate the retail locations that offer a Perka loyalty program.
    class Merchant < BaseEntityGlobal

      PROPERTY_NAMES = [
        :last_action_at,
        :program_tiers,
        :visit_expiration_minutes,
        :merchant_locations,
        :loyalty_type,

        # A list of Clerks, which are limited to acting on specific locations.
        :clerks,
        :merchant_state,
        :headline,
        :merchant_capabilities,
        :merchant_users,
        :notes,

        # Points-based merchants will define one or more catalog items for which 
        # points can be redeemed.
        :points_catalog_items,

        # Points-based merchants may offer a signup bonus to new customers for signing 
        # up.
        :points_signup_bonus,
        :terms,
        :sales_demo,
        :name
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end