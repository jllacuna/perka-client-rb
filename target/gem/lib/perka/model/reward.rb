# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A punchcard that a customer has filled or is in the process of filling. These 
    # objects represent an aggregated view of the effects of applying <entityReference 
    # payloadName='punchRewardConfirmation'> PunchRewardConfirmation</entityReference>. 
    # A Reward may be redeemed once it has been activated.
    class Reward < BaseEntityGlobal

      PROPERTY_NAMES = [
        :customer,
        :merchant,
        :program,
        :punches_earned,
        :reward_advancements,
        :redeemed_at,
        :activated_at,
        :sku_redeemed,
        :transferred_at
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      require 'perka/model/program'
      require 'perka/model/customer'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant,
        :program => Perka::Model::Program,
        :customer => Perka::Model::Customer
      }

    end
  end
end