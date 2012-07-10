# Generated File - DO NOT EDIT

require 'perka/model/abstract_reward_confirmation'

module Perka
  module Model 

    # Represents the redemption of a <entityReference payloadName='coupon'> Coupon</entityReference>.
    class RedemptionCouponConfirmation < AbstractRewardConfirmation

      PROPERTY_NAMES = [

        # The coupon that is being redeemed during the associated <entityReference 
        # payloadName='visit'> Visit</entityReference>.
        :coupon
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/coupon'
      TYPE_MAP = {
        :coupon => Perka::Model::Coupon
      }

    end
  end
end