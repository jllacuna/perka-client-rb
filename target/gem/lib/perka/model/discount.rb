# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class Discount < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :coupon_code,
        :order,
        :cash_back,
        :free_months,
        :percent_discount
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/order'
      TYPE_MAP = {
        :order => Perka::Model::Order
      }

    end
  end
end