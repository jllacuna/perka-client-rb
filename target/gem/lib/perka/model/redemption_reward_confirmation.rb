# Generated File - DO NOT EDIT

require 'perka/model/abstract_reward_confirmation'

module Perka
  module Model 

    # Represents the redemption of a completed punchcard.
    class RedemptionRewardConfirmation < AbstractRewardConfirmation

      PROPERTY_NAMES = [

        # The <entityReference payloadName='reward'> Reward</entityReference> that 
        # represents a specific instance of a completed punchcard.
        :reward
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/reward'
      TYPE_MAP = {
        :reward => Perka::Model::Reward
      }

    end
  end
end