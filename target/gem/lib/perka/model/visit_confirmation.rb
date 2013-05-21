# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Confirms a previously-created <entityReference payloadName='visit'> Visit</entityReference> 
    # that was the result of a <entityReference payloadName='customer'> Customer</entityReference> 
    # checking into a location.
    class VisitConfirmation < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [

        # The <entityReference payloadName='customer'> Customer</entityReference> 
        # associated with the <entityReference payloadName='visit'> Visit</entityReference>. 
        # This property is usually inferred from the associated <entityReference 
        # payloadName='visit'> Visit</entityReference>.
        :customer,

        # The <entityReference payloadName='merchant'> Merchant</entityReference> 
        # associated with the <entityReference payloadName='visit'> Visit</entityReference>. 
        # This property is usually inferred from the associated <entityReference 
        # payloadName='visit'> Visit</entityReference>.
        :merchant,

        # The previously-created <entityReference payloadName='visit'> Visit</entityReference> 
        # that is associated with a customer checkin.
        :visit,

        # The rewards associated with the visit (e.g. punches earned, coupons redeemed).
        :reward_confirmations
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      require 'perka/model/visit'
      require 'perka/model/customer'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant,
        :visit => Perka::Model::Visit,
        :customer => Perka::Model::Customer
      }

    end
  end
end