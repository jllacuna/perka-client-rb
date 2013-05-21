# Generated File - DO NOT EDIT

require 'perka/model/abstract_user'

module Perka
  module Model 

    # A Clerk represents either an employee identity or a role identity used by 
    # the validator app. <p> Two distinct classes of Clerks exist: <ul> <li>Named 
    # clerks, representing a user authorized to perform actions at zero or more 
    # locations <li>Anonymous clerks, representing an access role for a single location 
    # </ul> A named clerk must downgrade to an anonymous clerk in order to perform 
    # validations at a single location. This avoids the need to store any particular 
    # user's credentials in the validator app.
    class Clerk < AbstractUser

      PROPERTY_NAMES = [

        # The locations that the clerk is allowed to interact with.
        :merchant_locations,
        :email,
        :unconfirmed_email,
        :outbound_messages,

        # The <entityReference payloadName='merchant'> Merchant</entityReference> 
        # that owns the clerk account.
        :merchant,

        # Indicates if the Clerk is an anonymous role account used by a validator 
        # application at a single location.
        :anonymous
      ]
      attr_accessor *PROPERTY_NAMES


      require 'perka/model/merchant'
      TYPE_MAP = {
        :merchant => Perka::Model::Merchant
      }

    end
  end
end