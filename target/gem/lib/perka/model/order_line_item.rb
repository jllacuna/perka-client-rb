# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class OrderLineItem < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :display_name,
        :order,
        :unit_price,
        :catalog_item,
        :quantity
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/order'
      TYPE_MAP = {
        :order => Perka::Model::Order
      }

    end
  end
end