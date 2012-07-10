# Generated File - DO NOT EDIT

require 'perka/model/coupon_target'

module Perka
  module Model 

    # A CouponTarget that is always redeemable, but never visible to the customer. 
    # This target exists to allow a merchant to redeem a Perka Coupon if the customer 
    # has some kind of physical artifact (e.g. a mailer).
    class PhysicalRedemptionTarget < CouponTarget



    end
  end
end