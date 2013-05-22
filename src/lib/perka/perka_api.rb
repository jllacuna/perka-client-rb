require 'flatpack_core'

module Perka
  class PerkaApi < Perka::ClientApi
    
    include Flatpack::Core::MapInitialize
    
    attr_accessor :access_token, :access_expiration, :refresh_token, 
      :user_uuid, :integrator_id, :integrator_secret
    
    # our session is considered active if we've never received an access
    # token, or our token expiration as after now
    def session_active?
      !@access_token or @access_expiration > Time.now
    end
      
    def refresh_session
      oauth_refresh_token
    end
      
    # Concrete implementations that require authentication should implement 
    # this method if authenticated requests require custom request headers
    def auth_headers
      @access_token ? {'Authorization' => "Bearer #{@access_token}"} : {}
    end
    
    # Grants an integrator access token
    def oauth_integrator_login(integrator_id, integrator_secret)
      @integrator_id = integrator_id
      @integrator_secret = integrator_secret
      payload = 
        "grant_type=password"\
        "&username=#{integrator_id}"\
        "&client_id=#{integrator_id}"\
        "&password=#{URI::encode(integrator_secret)}"\
        "&scope=INTEGRATOR";
      
      execute_token_request(self, payload);
    end
    
    # returns a new PerkaApi authorized as the given role and user
    def oauth_integrator_become(role, uuid)
      role = role
      payload = "grant_type=client_credentials&scope=#{URI::encode(role)}:#{uuid}"
      new_api = PerkaApi.new({
        :server_base => @server_base,
        :flatpack => @flatpack,
        :access_token => @access_token,
        :access_expiration => @access_expiration,
        :integrator_secret => @integrator_secret,
        :integrator_id => @integrator_id,
        :verbose => @verbose,
      })
      execute_token_request(new_api, payload)
      new_api
    end
    
    # Obtain a new access token using integrator credentials and a refresh token.
    def oauth_refresh_token
      # Nil our access token so that we don't initiate another refresh on token execution
      @access_token      = nil
      @access_expiration = nil

      payload = "grant_type=refresh_token"\
        "&client_id=#{@integrator_id}"\
        "&client_secret=#{URI::encode(@integrator_secret)}"\
        "&refresh_token=#{@refresh_token}"
      
      execute_token_request(self, payload);
    end
    
    private 
    
    def execute_token_request(api, payload)
      json = TokenRequest.new(api, payload).execute
      status = json['status_code']
      expires = json['expires_in']
      api.access_expiration = Time.now + expires.to_i if expires
      api.access_token = json['access_token']
      api.refresh_token = json['refresh_token']
      uuid = json['uuid']
      api.user_uuid = uuid if uuid
    end
    
    class TokenRequest < Flatpack::Client::JsonRequest
      attr_accessor :payload
      
      def initialize(api, payload)
        @payload = payload
        super(api, "POST", "/api/2/auth/token");
        header("Content-Type", "application/x-www-form-urlencoded");
      end
    end
    
  end
end
