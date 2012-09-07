# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents a check-in at a <entityReference payloadName='merchantLocation'> 
    # MerchantLocation</entityReference> by a <entityReference payloadName='customer'> 
    # Customer</entityReference>.
    class Visit < BaseEntityGlobal

      PROPERTY_NAMES = [

        # Indicates that the Visit was created via the SMS endpoint and not from 
        # an app.
        :sms,

        # Where the Visit occurred.
        :merchant_location,
        :customer,

        # The punches earned during the Visit, broken out by <entityReference payloadName='reward'> 
        # Reward</entityReference>.
        :reward_advancements,

        # The time at which the visit was confirmed by the clerk.
        :validated_at,

        # The <entityReference payloadName='coupon'> Coupons</entityReference> that 
        # were redeemed during the visit.
        :coupon_redemptions,

        # Any feedback left by the Customer after the Visit was validated.
        :feedback_item
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/feedback_item'
      require 'perka/model/merchant_location'
      require 'perka/model/customer'
      TYPE_MAP = {
        :feedback_item => Perka::Model::FeedbackItem,
        :merchant_location => Perka::Model::MerchantLocation,
        :customer => Perka::Model::Customer
      }

    end
  end
end