# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Represents a pre-computed date and amount of money to charge a customer in 
    # association with a particular Order.
    class PaymentCoupon < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :id,
        :order,
        :amount,
        :diagnostics,
        :due_date,
        :payment_state,
        :processed_date
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/order'
      TYPE_MAP = {
        :order => Perka::Model::Order
      }

    end
  end
end