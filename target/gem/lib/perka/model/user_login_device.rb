# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class UserLoginDevice < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :hash,
        :make,
        :os_version,
        :platform,
        :device_id,
        :nonce,
        :push_token,
        :model
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end