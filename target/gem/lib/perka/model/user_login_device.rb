# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    class UserLoginDevice < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :hash,
        :model,
        :make,
        :os_version,
        :platform,
        :device_id,
        :nonce,
        :push_token
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end