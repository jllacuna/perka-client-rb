# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class OrderLineItem < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :order,
        :catalog_item,
        :quantity,
        :unit_price,
        :display_name
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/order'
      TYPE_MAP = {
        :order => Perka::Model::Order
      }

    end
  end
end