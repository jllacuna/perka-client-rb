# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Records the receipt of an SMS message.
    class SmsMessage < BaseEntityGlobal

      PROPERTY_NAMES = [
        :contents,
        :merchant_user,
        :customer,
        :from_sms_number,
        :provider_sid,
        :provider_status,
        :to_sms_number,
        :inbound
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant_user'
      require 'perka/model/customer'
      TYPE_MAP = {
        :merchant_user => Perka::Model::MerchantUser,
        :customer => Perka::Model::Customer
      }

    end
  end
end