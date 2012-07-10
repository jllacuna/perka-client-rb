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
        :managed_by,
        :merchant_state,

        # This is a foreign key into Authorize.net's backend for the merchant's 
        # billing information.
        :billing_profile_id,
        :sales_demo,
        :headline,
        :merchant_capabilities,
        :merchant_locations,
        :merchant_users,
        :notes,

        # Returns the MerchantStates that the Merchant user may transition to.
        :possible_merchant_states,
        :terms
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/integrator_user'
      TYPE_MAP = {
        :managed_by => Perka::Model::IntegratorUser
      }

    end
  end
end