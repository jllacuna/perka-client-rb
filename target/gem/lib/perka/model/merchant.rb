# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Merchants operate the retail locations that offer a Perka loyalty program.
    class Merchant < BaseEntityGlobal

      PROPERTY_NAMES = [
        :name,
        :managed,
        :merchant_state,
        :merchant_locations,
        :merchant_users,
        :last_action_at,
        :parent_merchant,

        # A list of Clerks, which are limited to acting on specific locations.
        :clerks,
        :visit_expiration_minutes,
        :loyalty_type,
        :sales_demo,
        :headline,
        :merchant_capabilities,
        :notes,

        # Points-based merchants will define one or more catalog items for which 
        # points can be redeemed.
        :points_catalog_items,

        # Points-based merchants may offer a signup bonus to new customers for signing 
        # up.
        :points_signup_bonus,

        # Returns the MerchantStates that the Merchant user may transition to.
        :possible_merchant_states,
        :program_tiers,
        :terms,
        :website_url,
        :managed_by
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      require 'perka/model/integrator_user'
      TYPE_MAP = {
        :parent_merchant => Perka::Model::Merchant,
        :managed_by => Perka::Model::IntegratorUser
      }

    end
  end
end