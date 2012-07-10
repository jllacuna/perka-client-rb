# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A carrier object for transmitting details about payment methods.
    class PaymentInstrument < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :cc_code,
        :cc_month,
        :cc_number,
        :cc_year,
        :check_account,
        :check_routing
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end