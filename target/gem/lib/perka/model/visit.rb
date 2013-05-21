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

        # The time at which the visit was confirmed by the clerk.
        :validated_at,

        # The latest <entityReference payloadName='pointsActivity'> PointsActivity</entityReference> 
        # for the Visit's <entityReference payloadName='customer'> Customer</entityReference> 
        # at the <entityReference payloadName='merchantLocation'> MerchantLocation</entityReference>. 
        # This may be null if the customer has no previous points activity at the 
        # merchant.
        :current_points_activity,

        # The punches earned during the Visit, broken out by <entityReference payloadName='reward'> 
        # Reward</entityReference>.
        :reward_advancements,
        :validated_at_timezone_offset,
        :points_activities,
        :coupon_redemptions
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/points_activity'
      require 'perka/model/merchant_location'
      require 'perka/model/customer'
      TYPE_MAP = {
        :current_points_activity => Perka::Model::PointsActivity,
        :merchant_location => Perka::Model::MerchantLocation,
        :customer => Perka::Model::Customer
      }

    end
  end
end