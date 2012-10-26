# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Allows a particular <entityReference payloadName='coupon'> Coupon</entityReference> 
    # to be offered at a single <entityReference payloadName='merchantLocation'> 
    # MerchantLocation</entityReference>. The visiblity of the <entityReference 
    # payloadName='coupon'> Coupon</entityReference> will be further filtered to 
    # a <entityReference payloadName='customer'> Customer</entityReference> based 
    # on the associated <entityReference payloadName='couponTarget'> CouponTarget</entityReference>.
    class CouponVisibility < BaseEntityGlobal

      PROPERTY_NAMES = [
        :merchant_location,
        :coupon_target,
        :coupon,
        :coupon_target_type
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant_location'
      require 'perka/model/coupon_target'
      require 'perka/model/coupon'
      TYPE_MAP = {
        :merchant_location => Perka::Model::MerchantLocation,
        :coupon_target => Perka::Model::CouponTarget,
        :coupon => Perka::Model::Coupon
      }

    end
  end
end