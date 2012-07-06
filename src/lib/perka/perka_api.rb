require 'flatpack_client'

module Perka
  class PerkaApi < Perka::ClientApi
    
    attr_accessor :access_expiration, :refresh_token, :user_uuid
    
    def oauth_integrator_login(integrator_id, integrator_secret)
      payload = 
        "grant_type=password"\
        "&username=#{integrator_id}"\
        "&client_id=#{integrator_id}"\
        "&password=#{URI::encode(integrator_secret)}"\
        "&scope=INTEGRATOR";
      puts payload
        
      execute_token_request(payload);
    end
    
    # returns a new PerkaApi authorized as the given role and user
    def oauth_integrator_become(role, user_uuid)
      role = user.role
      uuid = user.uuid
      payload = "grant_type=client_credentials&scope=#{URI::encode(role)}:#{uuid}"
      new_api = PerkaApi.new(@flatpack)
      new_api.access_token = @access_token
      new_api.verbose = @verbose
      new_api.execute_token_request(payload)
      new_api
    end
    
    private 
    
    def execute_token_request(payload)
      json = TokenRequest.new(self, payload).execute
      status = json['status_code']
      puts "Token request executed with status: #{status}"
      puts JSON.pretty_generate(json)
      
      expires = json['expires_in']
      @access_token_expiration = Time.now + expires.to_i if expires
      @access_token = json['access_token']
      @refresh_token = json['refresh_token']
      uuid = json['uuid']
      @user_uuid = uuid if uuid
    end
    
    class TokenRequest < Flatpack::Client::JsonRequest
      
      def initialize(api, payload)
        @payload = payload
        super(api, "POST", "/api/2/auth/token");
        header("Content-Type", "application/x-www-form-urlencoded");
      end
      
      def write_entity(req)
        req.body = @payload
      end
    end
    
  end
end