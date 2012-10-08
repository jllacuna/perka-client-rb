# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Describes an <code>HTTP</code> request endpoint.
    class EndpointDescription < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [

        # Describes any query parameters for the endpoint.
        :query_parameters,

        # The expected entity type for the request. Generally, the <code>HTTP POST</code> 
        # body.
        :entity,

        # Describes any parameters embedded in #getPath().
        :path_parameters,
        :doc_string,

        # Return the role names that are allowed to access the endpoint. A <code>null</code> 
        # value means that all roles are allowed, while a zero-length value means 
        # that no roles are allowed.
        :role_names,

        # The HTTP method used to access the endpoint.
        :method,

        # The expected contents for the HTTP response.
        :return_type,

        # The path used to access the endpoint.
        :path
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/type'
      require 'perka/model/type'
      TYPE_MAP = {
        :entity => Perka::Model::Type,
        :return_type => Perka::Model::Type
      }

    end
  end
end