# Generated File - DO NOT EDIT

require 'perka/model/coupon_target'

module Perka
  module Model 

    # Makes coupons available to customers who are members of a given <entityReference 
    # payloadName='programTier'> ProgramTier</entityReference>.
    class TierTarget < CouponTarget

      PROPERTY_NAMES = [
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