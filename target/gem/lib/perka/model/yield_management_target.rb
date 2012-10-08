# Generated File - DO NOT EDIT

require 'perka/model/coupon_target'

module Perka
  module Model 

    class YieldManagementTarget < CouponTarget

      PROPERTY_NAMES = [

        # Returns the minutes-of-day that the redemption window closes.
        :local_redemption_end_at,

        # Returns the minutes-of-day that the redemption window opens.
        :local_redemption_start_at
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end