# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Represents a selection from the industry Miller column in the signup app.
    class Selection < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :signup_data,
        :value
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/billing_data'
      TYPE_MAP = {
        :signup_data => Perka::Model::BillingData
      }

    end
  end
end