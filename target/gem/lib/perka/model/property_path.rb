# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Represents a sequence of simple property evaluations.
    class PropertyPath < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [

        # Return an unmodifiable view of the properties that comprise the path.
        :path
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end