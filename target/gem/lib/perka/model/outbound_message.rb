# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    class OutboundMessage < BaseEntityGlobal

      PROPERTY_NAMES = [
        :state,
        :customer,
        :body,
        :merchant_user,
        :embargo_time,

        # This property is used to prevent a recipient from being messaged excessively. 
        # There is a unique constraint in the database that will prevent two messages 
        # from being persisted that have the same token. The
        :rate_limit_token,

        # Populated when the message has been queued in the SQS queue.
        :sqs_message_id
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