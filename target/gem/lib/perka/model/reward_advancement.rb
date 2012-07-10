# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents partial progress towards completing a Reward (i.e. some number 
    # of punches). These objects represent the aggregated effects of applying a 
    # <entityReference payloadName='punchRewardConfirmation'> PunchRewardConfirmation</entityReference>.
    class RewardAdvancement < BaseEntityGlobal

      PROPERTY_NAMES = [
        :punches_earned,
        :reward,
        :visit,
        :transfer
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/reward'
      require 'perka/model/visit'
      TYPE_MAP = {
        :reward => Perka::Model::Reward,
        :visit => Perka::Model::Visit
      }

    end
  end
end