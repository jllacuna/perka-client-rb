# Generated File - DO NOT EDIT

require 'perka/model/abstract_user'

module Perka
  module Model 

    # Represents a business owner or manager who is allowed to modify the associated 
    # <entityReference payloadName='merchant'> Merchant</entityReference> object.
    class MerchantUser < AbstractUser

      PROPERTY_NAMES = [
        :email,
        :unconfirmed_email,
        :merchant,
        :weekly_email_enabled,
        :sms_messages,
        :outbound_messages
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant
      }

    end
  end
end