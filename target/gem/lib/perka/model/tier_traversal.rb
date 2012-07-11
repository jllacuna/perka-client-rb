# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Maps a <entityReference payloadName='customer'> Customer</entityReference> 
    # to a <entityReference payloadName='programTier'> ProgramTier</entityReference> 
    # and provides the total number of validated visits to the associated <entityReference 
    # payloadName='merchant'> Merchant</entityReference>.
    class TierTraversal < BaseEntityGlobal

      PROPERTY_NAMES = [
        :customer,
        :program_tier,
        :visit_count
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/program_tier'
      require 'perka/model/customer'
      TYPE_MAP = {
        :program_tier => Perka::Model::ProgramTier,
        :customer => Perka::Model::Customer
      }

    end
  end
end