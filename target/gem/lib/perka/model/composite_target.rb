# Generated File - DO NOT EDIT

require 'perka/model/coupon_target'

module Perka
  module Model 

    # A <entityReference payloadName='couponTarget'> CouponTarget</entityReference> 
    # that acts as a union or intersection of other <entityReference payloadName='couponTarget'> 
    # CouponTarget</entityReference> objects.
    class CompositeTarget < CouponTarget

      PROPERTY_NAMES = [
        :operation,
        :children
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end