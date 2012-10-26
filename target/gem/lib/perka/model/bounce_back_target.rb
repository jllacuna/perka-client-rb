# Generated File - DO NOT EDIT

require 'perka/model/yield_management_target'

module Perka
  module Model 

    # A coupon target that enables a coupon after a customer has a confirmed visit. 
    # <p> There are two time windows used in a BounceBackTarget: the "open" window 
    # and the "redemption" window. These (possibly-overlapping) windows are expressed 
    # in terms of the local time the location where the the customer has checked 
    # in. The open window determines at what time a qualifying visit must be made 
    # and the redemption window (inherited from <entityReference payloadName='yieldManagementTarget'> 
    # YieldManagementTarget</entityReference> determines the time of day that the 
    # coupon may be redeemed. Additionally, the <code>redemptionDays</code> property 
    # may be used to allow the redemption to occur within some number of days following 
    # the qualifying visit. <p> Suppose a cafe wanted to encourage breakfast customers 
    # to return for lunch within the next three days. The BounceBackTarget would 
    # be configured thusly: <ul> <li>Open window: 0600 - 0900 <li>Redemption window: 
    # 1100 - 1300 <li>Redemption days: 3 </ul> If a customer were to have a qualifying 
    # visit on a Monday morning, the coupon would be eligable for redemption between 
    # 1100 and 1300 on Monday, Tuesday, and Wednesday: <pre> Open Window Redemption 
    # Window | 0600 --- 0900 | | 1100 --- 1300 | Sunday : Monday : Visit Can redeem 
    # Tuesday : Can redeem Wednesday : Can redeem Thursday : Too late </pre> Once 
    # the coupon has been redeemed, the <code>redemptionCountPerWindow</code> property 
    # determines whether or not the coupon stays available until there is another 
    # qualifying visit.
    class BounceBackTarget < YieldManagementTarget

      PROPERTY_NAMES = [

        # Returns the minutes-of-day that the bounceback window closes.
        :local_open_end_at,

        # Returns the minutes-of-day that the bounceback window opens.
        :local_open_start_at,

        # Returns the maximum number of times a customer may redeem the bounce-back 
        # coupon for any given qualifying visit. The default value is <code>1</code>. 
        # A value of <code>0</code> allows unlimited use of the bounce-back offer. 
        # <p> This property is tracked separately from the global-maximum number 
        # of times the associated Coupon may be redeemed.
        :redemption_count_per_window,

        # Returns the number of days that the qualifying visit is good for. The 
        # default value is <code>1</code>, which indicates that the coupon must 
        # be redeemed on the same day as the qualifying visit.
        :redemption_days
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end