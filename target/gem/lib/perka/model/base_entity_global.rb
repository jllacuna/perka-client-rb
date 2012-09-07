# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Provides random uuid generation
    class BaseEntityGlobal < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [

        # Returns the time at which the entity was first persisted to the Perka 
        # database.
        :created_at,

        # Returns the last time at which an update to the entity was persisted to 
        # the database. This property will be null for entities that have never 
        # been mutated since originally being persisted.
        :updated_at
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end