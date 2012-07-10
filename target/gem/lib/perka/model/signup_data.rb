# Generated File - DO NOT EDIT

require 'perka/model/billing_data'

module Perka
  module Model 

    # This is a carrier object used by the online signup app.
    class SignupData < BillingData

      PROPERTY_NAMES = [
        :merchant,
        :catalog_items,
        :coupon_code,
        :lead_source,
        :location_count,
        :marketing_source,
        :order,
        :accepts_terms
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/order'
      require 'perka/model/merchant'
      TYPE_MAP = {
        :order => Perka::Model::Order,
        :merchant => Perka::Model::Merchant
      }

    end
  end
end