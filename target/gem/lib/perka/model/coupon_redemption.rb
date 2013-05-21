# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a <entityReference payloadName='customer'> Customer</entityReference>'s 
    # redemption of a particular <entityReference payloadName='coupon'> Coupon</entityReference>.
    class CouponRedemption < BaseEntityGlobal

      PROPERTY_NAMES = [
        :coupon,
        :redeemed_at,
        :visit
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