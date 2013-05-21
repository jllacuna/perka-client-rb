# Generated File - DO NOT EDIT

require 'perka/model/abstract_user'

module Perka
  module Model 

    # An identity that represents an external API consumer. The IntegratorUser is 
    # mainly used to obtain access tokens to act as other users.
    class IntegratorUser < AbstractUser

      PROPERTY_NAMES = [
        :managed_merchants
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end