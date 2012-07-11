# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class Order < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :location_count,
        :discount,
        :line_items,
        :merchant_uuid,
        :payment_coupons,
        :renewal_date,
        :id
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/discount'
      TYPE_MAP = {
        :discount => Perka::Model::Discount
      }

    end
  end
end