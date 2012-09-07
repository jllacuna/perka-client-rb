# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A description of the entities contained within an API.
    class ApiDescription < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :entities,
        :api_name,
        :api_version,
        :endpoints
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end