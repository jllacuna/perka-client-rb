# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A transfer object used to hold data related to account creation and maintenance.
    class UserCredentials < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :email,
        :first_name,
        :last_name,
        :new_password,
        :new_password_confirmation,
        :phone,
        :phone_confirmation_code,
        :current_password,
        :hmac,
        :user_uuid
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end