# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Stores summary information about the disposition of push messages. This type 
    # exists because push messages are typically sent in bulk from a single <entityReference 
    # payloadName='pushOutboundMessage'> PushOutboundMessage</entityReference>.
    class PushStatus < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [

        # The push service used to contact the customer.
        :platform,

        # The status of the individual push message.
        :disposition,
        :token
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end