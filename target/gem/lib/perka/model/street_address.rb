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
        :address,
        :state,
        :country,
        :address_2,
        :city,
        :zip
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end