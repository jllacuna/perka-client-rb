# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A carrier object used by the merchant dashboard to request a change to the 
    # merchant's billing information.
    class BillingData < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :billing_address,
        :billing_profile_id,
        :payment_instrument
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/street_address'
      require 'perka/model/payment_instrument'
      TYPE_MAP = {
        :billing_address => Perka::Model::StreetAddress,
        :payment_instrument => Perka::Model::PaymentInstrument
      }

    end
  end
end