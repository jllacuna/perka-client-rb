# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    class CouponVisibility < BaseEntityGlobal

      PROPERTY_NAMES = [
        :merchant_location,
        :coupon,
        :coupon_target,
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