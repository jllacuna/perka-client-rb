# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A CouponCampaign defines a relationship between what a merchant thinks of 
    # as a coupon and the collection of Coupon objects that implement the behavior. 
    # In general, a campaign consists of Coupons that span a non-contiguous set 
    # of time ranges, but that are otherwise identical in configuration.
    class CouponCampaign < BaseEntityGlobal

      PROPERTY_NAMES = [
        :coupons,

        # Retains the original <code>RRULE</code> string used to construct the campaign.
        :rrule,
        :title
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end