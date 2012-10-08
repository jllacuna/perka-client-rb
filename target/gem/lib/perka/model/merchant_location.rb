# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a single physical location operated by a Merchant where Customers 
    # can participate in a Perka loyalty program.
    class MerchantLocation < BaseEntityGlobal

      PROPERTY_NAMES = [
        :phone,
        :merchant,
        :timezone,

        # The named Clerks which are allowed to operate on the MerchantLocation. 
        # This relationship is owned by the Clerk object.
        :clerks,

        # Used to implicitly concatenate the <code>address</code> and <code>address2</code> 
        # fields in a friendly format.
        :combined_address,
        :coupon_visibilities,
        :distance_in_meters,
        :latitude,
        :longitude,
        :merchant_devices,
        :neighborhood_name,
        :resolved_facebook_id,
        :sms_id,
        :geo_location
      ]
      attr_accessor *PROPERTY_NAMES

      EMBEDDED_PROPERTY_NAMES = [
        :street_address
      ]
      attr_accessor *EMBEDDED_PROPERTY_NAMES

      require 'perka/model/street_address'
      require 'perka/model/merchant'
      TYPE_MAP = {
        :street_address => Perka::Model::StreetAddress,
        :merchant => Perka::Model::Merchant
      }

    end
  end
end