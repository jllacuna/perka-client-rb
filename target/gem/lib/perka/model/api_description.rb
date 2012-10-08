# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # A description of the entities contained within an API.
    class ApiDescription < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :api_name,
        :api_version,
        :endpoints,
        :entities
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end