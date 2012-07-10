# Generated File - DO NOT EDIT

require 'perka/model/abstract_user'

module Perka
  module Model 

    # A Customer is someone who visits a <entityReference payloadName='merchantLocation'> 
    # MerchantLocation</entityReference> and engages in a retail transaction.
    class Customer < AbstractUser

      PROPERTY_NAMES = [
        :avatar_url,
        :customer_devices,

        # Returns the long name of the last known timezone for the user.
        :last_known_time_zone,

        # The integrator that created the Customer object.
        :managed_by,
        :rewards,
        :sms_messages,
        :social_service_subscriptions,
        :tier_traversals,

        # You probably want #getLastVisit().
        :visits,
        :waiting_merchant_location,
        :waiting_name_since,
        :account_created,
        :specials_messaging_enabled
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/merchant_location'
      require 'perka/model/integrator_user'
      TYPE_MAP = {
        :waiting_merchant_location => Perka::Model::MerchantLocation,
        :managed_by => Perka::Model::IntegratorUser
      }

    end
  end
end