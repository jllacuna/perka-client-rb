# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class Order < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :id,
        :location_count,
        :line_items,
        :discount,
        :merchant_uuid,
        :payment_coupons,
        :renewal_date
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/discount'
      TYPE_MAP = {
        :discount => Perka::Model::Discount
      }

    end
  end
end