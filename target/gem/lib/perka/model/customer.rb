# Generated File - DO NOT EDIT

require 'perka/model/abstract_user'

module Perka
  module Model 

    # A Customer is someone who visits a <entityReference payloadName='merchantLocation'> 
    # MerchantLocation</entityReference> and engages in a retail transaction.
    class Customer < AbstractUser

      PROPERTY_NAMES = [
        :avatar_url,

        # Returns the long name of the last known timezone for the user.
        :last_known_time_zone,
        :social_service_subscriptions,
        :account_created,
        :specials_messaging_enabled
      ]
      attr_accessor *PROPERTY_NAMES


    end
  end
end