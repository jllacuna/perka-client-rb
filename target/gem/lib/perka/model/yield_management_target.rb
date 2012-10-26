# Generated File - DO NOT EDIT

require 'perka/model/coupon_target'

module Perka
  module Model 

    # A coupon target that enables a coupon during a specific time range during 
    # the day. The prototypical use of this target is for happy-hour specials. <p> 
    # The redemption window is expressed as location-relative local times (e.g. 
    # <code>1530</code>).
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