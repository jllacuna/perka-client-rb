# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A ProgramType defines a single kind of offer made by the Merchant. For example, 
    # a Merchant may have two ProgramTypes, one for coffee sales and another for 
    # sandwich sales. Because Customers are offered increasingly better perks as 
    # they return over time, a single ProgramType is used to aggregate multiple 
    # <entityReference payloadName='program'> Program</entityReference> objects 
    # that have a fan-out based on <entityReference payloadName='programTier'> ProgramTier</entityReference>.
    class ProgramType < BaseEntityGlobal

      PROPERTY_NAMES = [
        :name,
        :shared,
        :expires_at,
        :position,
        :programs,
        :stamp_id,
        :expires_in
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end