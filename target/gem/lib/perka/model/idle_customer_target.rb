# Generated File - DO NOT EDIT

require 'perka/model/list_target'

module Perka
  module Model 

    # The customers whose last confirmed visit was more than some number of days 
    # ago.
    class IdleCustomerTarget < ListTarget

      PROPERTY_NAMES = [
        :idle_days
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end