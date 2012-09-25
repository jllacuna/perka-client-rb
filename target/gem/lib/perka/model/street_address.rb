# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A simple representation of a mailing address. It is intended to be used as 
    # a payload carrier object or as an embeddable JPA object. <p> All of the properties 
    # in this object are marked as PermitAll because access to the StreetAddress 
    # itself is controlled by the enclosing object.
    class StreetAddress < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :address_2,
        :city,
        :zip,
        :address,
        :state,
        :country
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end