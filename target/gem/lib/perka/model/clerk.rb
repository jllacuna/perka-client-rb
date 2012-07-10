# Generated File - DO NOT EDIT

require 'perka/model/abstract_user'

module Perka
  module Model 

    # A Clerk is a non-persistent user used by the Merchant Validator app whose 
    # UUID is arbitrarily set to the MerchantLocation at which the validator app 
    # is installed.
    class Clerk < AbstractUser

      PROPERTY_NAMES = [
        :merchant
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/merchant'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant
      }

    end
  end
end