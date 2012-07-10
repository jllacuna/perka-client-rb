# Generated File - DO NOT EDIT

require 'perka/model/base_entity_global'

module Perka
  module Model 

    # Maps a local entity onto some identity in a foreign service. For examle, an 
    # AbstractUser could be mapped onto a Facebook user id, while a MerchantLocation 
    # might be mapped onto a place id. <p> This class also retains information relating 
    # to oauth2 login information.
    class SocialServiceIdentity < BaseEntityGlobal

      PROPERTY_NAMES = [

        # Identifies the service the identity belongs to.
        :social_service,
        :access_token,
        :access_token_expiration,

        # A URI that the local user should be redirected to after completing a login 
        # process.
        :continue_uri,

        # The public identifier for the identity (generally a username).
        :friendly_id,
        :local_entity,

        # Used for the oauth2 <code>state</code> parameter to prevent replay attacks.
        :login_nonce,

        # Stores an oauth2 refresh token to resume access as the foreign identity.
        :refresh_token,

        # If the remote service uses internal ids separate from the public id, the 
        # resolved identifier should be stored in this field. For example, Facebook 
        # assigns numeric identifiers as primary keys.
        :resolved_id
      ]
      attr_accessor *PROPERTY_NAMES

      require 'perka/model/base_entity_global'
      TYPE_MAP = {
        :local_entity => Perka::Model::BaseEntityGlobal
      }

    end
  end
end