# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # A join object to associate a <entityReference payloadName='customer'> Customer</entityReference> 
    # with an <entityReference payloadName='listTarget'> ListTarget</entityReference>. 
    # The presence of a membership only implies eligibility, the com.getperka.model.domain.Customer) 
    # Customer) must be called to make a definitive determination, however the total 
    # count of <entityReference payloadName='couponTargetMembership'> CouponTargetMembership</entityReference> 
    # objects can be used as an approximation.
    class CouponTargetMembership < BaseEntityGlobal

      PROPERTY_NAMES = [
        :customer,
        :coupon_visibility,
        :list_target
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/list_target'
      require 'perka/model/customer'
      require 'perka/model/coupon_visibility'
      TYPE_MAP = {
        :list_target => Perka::Model::ListTarget,
        :customer => Perka::Model::Customer,
        :coupon_visibility => Perka::Model::CouponVisibility
      }

    end
  end
end