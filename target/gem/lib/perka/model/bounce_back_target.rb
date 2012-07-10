# Generated File - DO NOT EDIT

require 'perka/model/yield_management_target'

module Perka
  module Model 

    class BounceBackTarget < YieldManagementTarget

      PROPERTY_NAMES = [

        # Returns the minutes-of-day that the bounceback window closes.
        :local_open_end_at,

        # Returns the minutes-of-day that the bounceback window opens.
        :local_open_start_at,

        # Returns the maximum number of times a customer may redeem the bounce-back 
        # coupon within any given bounce-back window. This property is separate 
        # from the maximum number of times the associated Coupon may be redeemed. 
        # The default value is <code>1</code>. A value of <code>0</code> allows 
        # unlimited use of the bounce-back offer.
        :redemption_count_per_window,

        # Returns the minutes-of-day that the bounceback window closes.
        :redemption_days
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end