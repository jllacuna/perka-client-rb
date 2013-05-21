# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Program is a basic buy n(punchesNeeded) of x(purchasedItem), and get a free 
    # y(freeItem) when a customer has reached a certain ProgramTier.
    class Program < BaseEntityGlobal

      PROPERTY_NAMES = [
        :program_tier,
        :program_type,
        :image_name,
        :perk_id,
        :punches_needed,
        :free_item,
        :terms,
        :punches_needed_prefix,
        :punches_needed_suffix,
        :purchased_item
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/program_tier'
      require 'perka/model/program_type'
      TYPE_MAP = {
        :program_tier => Perka::Model::ProgramTier,
        :program_type => Perka::Model::ProgramType
      }

    end
  end
end