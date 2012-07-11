# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A program tier defines additional benefits for customers with a certain minimum 
    # visit count.
    class ProgramTier < BaseEntityGlobal

      PROPERTY_NAMES = [
        :merchant,
        :programs,
        :visits_needed,
        :additional_perks,
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