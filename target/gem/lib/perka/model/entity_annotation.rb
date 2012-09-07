# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Allows integrators to associate an arbitrary JSON object with a persistent 
    # entity. Any instance of an EntityAnnotation is specific to a particular IntegratorUser 
    # and multiple integrators may annotate the same entity. <p> When a request 
    # is made to the API server by an integrator or by any other user that is managed 
    # by an integrator, any EntityAnnotations associated with objects in the returned 
    # payload will be included as extra data.
    class EntityAnnotation < BaseEntityGlobal

      PROPERTY_NAMES = [

        # The custom data which may be any JSON value.
        :annotation,

        # The target entity for the annotation.
        :entity
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/base_entity_global'
      TYPE_MAP = {
        :entity => Perka::Model::BaseEntityGlobal
      }

    end
  end
end