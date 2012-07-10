# Generated File - DO NOT EDIT

require 'flatpack_core'

module Perka
  module Model 

    # Encapsulates one or more <entityReference payloadName='abstractRewardConfirmation'> 
    # AbstractRewardConfirmation</entityReference> objects to be given to a customer. 
    # <p> This differs from a <entityReference payloadName='visitConfirmation'> 
    # VisitConfirmation</entityReference> in that there's no previously-created 
    # Visit object to confirm. Instead, a RewardGrant will create a confirmed Visit 
    # and possibly create a Customer object based on an email address or SMS phone 
    # number. The UUID of the Visit object will be set to the RewardGrant's UUID 
    # to allow post-grant correlation. <p> Exactly one of <entityReference payloadName='rewardGrant'> 
    # #getCustomerEmail()</entityReference>, <entityReference payloadName='rewardGrant'> 
    # #getCustomerPhone()</entityReference>, or <entityReference payloadName='rewardGrant'> 
    # #getCustomerUuid()</entityReference> must be provided to identify the customer.
    class RewardGrant < Flatpack::Core::BaseHasUuid

      PROPERTY_NAMES = [
        :customer,

        # At least one <entityReference payloadName='abstractRewardConfirmation'> 
        # AbstractRewardConfirmation</entityReference> must be given.
        :reward_confirmations
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/customer'
      TYPE_MAP = {
        :customer => Perka::Model::Customer
      }

    end
  end
end