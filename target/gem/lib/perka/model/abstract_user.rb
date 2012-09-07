# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A supertype for all objects representing an identity. Each subtype of AbstractUser 
    # has an associated role which is used to controll access to API endpoints and 
    # model properties.
    class AbstractUser < BaseEntityGlobal

      PROPERTY_NAMES = [

        # A user's role is used to control access to API endpoints and model properties.
        :role,
        :email,
        :first_name,
        :last_name,
        :new_password,
        :new_password_confirmation,
        :phone,

        # Users whose email addresses have not been confirmed via a click-to-confirm 
        # email will have this field populated. Multiple user entities may share 
        # the same unconfirmed email address. When the address is confirmed, these 
        # entities will be merged.
        :unconfirmed_email,
        :unconfirmed_phone,
        :password_set
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end