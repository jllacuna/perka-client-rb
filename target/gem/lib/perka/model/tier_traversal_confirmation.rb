# Generated File - DO NOT EDIT

require 'perka/model/abstract_reward_confirmation'

module Perka
  module Model 

    # Allows a customer to be placed in an arbitrary program tier. This confirmation 
    # type may be used to demote a customer to a lower tier if the customer does 
    # not meet the visit count requirement for membership in its current tier.
    class TierTraversalConfirmation < AbstractRewardConfirmation

      PROPERTY_NAMES = [

        # The ProgramTier that the customer associated with the visit should be 
        # moved into.
        :program_tier
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/program_tier'
      TYPE_MAP = {
        :program_tier => Perka::Model::ProgramTier
      }

    end
  end
end