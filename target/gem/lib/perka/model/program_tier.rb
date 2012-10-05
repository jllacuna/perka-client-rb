# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A program tier defines additional benefits for customers with a certain minimum 
    # visit count.
    class ProgramTier < BaseEntityGlobal

      PROPERTY_NAMES = [
        :tier_traversals,
        :merchant,
        :programs,
        :additional_perks,
        :points_multiplier,
        :visits_needed,
        :name
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/merchant'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant
      }

    end
  end
end