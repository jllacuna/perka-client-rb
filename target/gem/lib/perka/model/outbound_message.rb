# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    class OutboundMessage < BaseEntityGlobal

      PROPERTY_NAMES = [
        :merchant_user,
        :clerk,
        :customer,
        :body,
        :internal_user
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant_user'
      require 'perka/model/clerk'
      require 'perka/model/customer'
      require 'perka/model/internal_user'
      TYPE_MAP = {
        :merchant_user => Perka::Model::MerchantUser,
        :clerk => Perka::Model::Clerk,
        :customer => Perka::Model::Customer,
        :internal_user => Perka::Model::InternalUser
      }

    end
  end
end