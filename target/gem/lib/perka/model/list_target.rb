# Generated File - DO NOT EDIT

require 'perka/model/coupon_target'

module Perka
  module Model 

    # A base type for customer classes that restrict a CouponVisibility to a list 
    # of Customers. This base type is appropriate for memberships that do not change 
    # on a frequent basis or ones that are computationally-intensive to compute.
    class ListTarget < CouponTarget

      PROPERTY_NAMES = [

        # Indicates that the class should match all Customers, regardless of whether 
        # or not a <entityReference payloadName='couponTargetMembership'> CouponTargetMembership</entityReference> 
        # exists.
        :all_customers
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end