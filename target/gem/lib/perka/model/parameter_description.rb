# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Describes a path or query parameter in <entityReference payloadName='endpointDescription'> 
    # EndpointDescription</entityReference>.
    class ParameterDescription < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :name,
        :type,
        :doc_string,
        :endpoint
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/type'
      require 'perka/model/endpoint_description'
      TYPE_MAP = {
        :type => Perka::Model::Type,
        :endpoint => Perka::Model::EndpointDescription
      }

    end
  end
end