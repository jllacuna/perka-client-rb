# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    class CouponRedemption < BaseEntityGlobal

      PROPERTY_NAMES = [
        :coupon,
        :visit,
        :redeemed_at
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/visit'
      require 'perka/model/coupon'
      TYPE_MAP = {
        :visit => Perka::Model::Visit,
        :coupon => Perka::Model::Coupon
      }

    end
  end
end