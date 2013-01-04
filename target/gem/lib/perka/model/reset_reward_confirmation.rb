# Generated File - DO NOT EDIT

require 'perka/model/abstract_reward_confirmation'

module Perka
  module Model 

    # Allows a previously-redeemed Reward to be redeemed again. This can be used 
    # as part of a <entityReference payloadName='rewardGrant'> RewardGrant</entityReference> 
    # or <entityReference payloadName='visitConfirmation'> VisitConfirmation</entityReference>.
    class ResetRewardConfirmation < AbstractRewardConfirmation

      PROPERTY_NAMES = [

        # The reward to re-issue.
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