# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Represents activity in a points-based loyalty program.
    class PointsActivity < BaseEntityGlobal

      PROPERTY_NAMES = [
        :visit,
        :credit,
        :current_total,

        # The number of points that were redeemed
        :charge,
        :next_activity,
        :redeemed
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/points_catalog_item'
      require 'perka/model/points_activity'
      require 'perka/model/visit'
      TYPE_MAP = {
        :redeemed => Perka::Model::PointsCatalogItem,
        :next_activity => Perka::Model::PointsActivity,
        :visit => Perka::Model::Visit
      }

    end
  end
end