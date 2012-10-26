# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # The CustomerClass hierarchy defines memberships rules that have been defined 
    # by a Merchant.
    class CouponTarget < BaseEntityGlobal

      PROPERTY_NAMES = [

        # An optional child-to-parent relationship that allows behaviors to be aggregated 
        # together.
        :parent,
        :merchant
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      require 'perka/model/composite_target'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant,
        :parent => Perka::Model::CompositeTarget
      }

    end
  end
end