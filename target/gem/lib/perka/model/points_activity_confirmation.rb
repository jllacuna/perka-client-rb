# Generated File - DO NOT EDIT

require 'perka/model/abstract_reward_confirmation'

module Perka
  module Model 

    # Represents activity in a points-based loyalty program.
    class PointsActivityConfirmation < AbstractRewardConfirmation

      PROPERTY_NAMES = [

        # The total dollar amount spent during the transaction.
        :money_spent,

        # Catalog items that are being redeemed.
        :points_catalog_items
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end