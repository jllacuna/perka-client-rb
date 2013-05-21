# Generated File - DO NOT EDIT

require 'perka/model/outbound_message'

module Perka
  module Model 

    # An implementation of outbound message corresponding to a message being sent 
    # over a platform push notification system (e.g. C2DM for Android or APS for 
    # iOS)
    class PushOutboundMessage < OutboundMessage

      PROPERTY_NAMES = [
        :push_status,
        :push_expires_at,
        :push_extra_data
      ]
      attr_accessor *PROPERTY_NAMES



    end
  end
end