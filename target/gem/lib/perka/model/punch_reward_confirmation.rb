# Generated File - DO NOT EDIT

require 'perka/model/abstract_reward_confirmation'

module Perka
  module Model 

    # Represents an award of some number of punches on a punchcard.
    class PunchRewardConfirmation < AbstractRewardConfirmation

      PROPERTY_NAMES = [

        # An instance of a <entityReference payloadName='program'> Program</entityReference> 
        # that the punches should be applied to.
        :program,
        :program_type,

        # The number of punches to be applied to the punchcard.
        :punches_earned,

        # This property is only present when a <entityReference payloadName='punchRewardConfirmation'> 
        # PunchRewardConfirmation</entityReference> is returned by the server to 
        # represent past customer interactions. Normally, a <entityReference payloadName='punchRewardConfirmation'> 
        # PunchRewardConfirmation</entityReference> is a member of a <entityReference 
        # payloadName='rewardGrant'> RewardGrant</entityReference> or <entityReference 
        # payloadName='visitConfirmation'> VisitConfirmation</entityReference> which 
        # will provide a contextual <entityReference payloadName='visit'> Visit</entityReference>.
        :visit
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/program'
      require 'perka/model/visit'
      require 'perka/model/program_type'
      TYPE_MAP = {
        :program => Perka::Model::Program,
        :visit => Perka::Model::Visit,
        :program_type => Perka::Model::ProgramType
      }

    end
  end
end