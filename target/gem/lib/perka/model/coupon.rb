# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a specific offer extended to a merchant's customer base.
    class Coupon < BaseEntityGlobal

      PROPERTY_NAMES = [
        :summary,
        :redemption_limit,

        # The CouponVisibilites that control where and to whom the Coupon is available.
        :coupon_visibilities,
        :title,

        # The parent CouponCampaign that aggregates related Coupons.
        :coupon_campaign,

        # The short perk icon name (e.g. <code>unicorn</code>).
        :image_name,

        # This property doesn't represent a single instance in time (i.e. a number 
        # of milliseconds past the epoch in UTC time). Instead, this value must 
        # be interpreted using the user's local timezone. For example, if the exact 
        # instant stored in this value is noon UTC time on such-and-such a day, 
        # this value should be interpreted to mean noon on that same date in the 
        # user's local timezone.
        :local_begins_at,

        # See note on #getLocalBeginsAt() on how to interpret this.
        :local_ends_at,
        :notify_minutes_before,
        :perk_id,
        :url,

        # Indicates whether or not the Coupon will be actively pushed to customer 
        # devices, or if it is a passive coupon.
        :push_enabled
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/coupon_campaign'
      TYPE_MAP = {
        :coupon_campaign => Perka::Model::CouponCampaign
      }

    end
  end
end