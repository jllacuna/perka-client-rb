# Generated File - DO NOT EDIT
require 'flatpack_client'

module Perka
  class ClientApi < Flatpack::Client::BaseApi
    include Flatpack::Core::MapInitialize

    # Returns the manifest of perk icon names.
    def asset_manifest_perks_get
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/asset/manifest/perks")
      to_return
    end

    # Retrieves the customer associated with the given uuid. The response will include 
    # reward and tierTraversal information for the merchant associated with the 
    # logged in clerk or merchantUser.
    def customer_uuid_get(uuid)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/customer/{uuid}", uuid)
      to_return
    end

    # Returns the current customer's PointsActivity status across all merchants 
    # with a points-based loyalty system.
    def customer_points_get
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/customer/points")
      to_return
    end

    # Performs a deep serialization of an entity. This endpoint is intended to provide 
    # supplementary one-to-many relationship data that is not normally serialized 
    # to keep payload sizes manageable.
    def describe_type_uuid_get(type, uuid)
      to_return = DescribeTypeUuidGet.new(self, type, uuid)
      to_return
    end

    # Provides a machine-readable description of an entity type per the logged-in 
    # role.
    def describe_type_get(type)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/describe/{type}", type)
      to_return
    end

    # Returns a description of the methods and entity types used by the API server.
    def describe_get
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/describe")
      to_return
    end

    # A diagnostic endpoint to extract the information from an OAuth2 authorization 
    # code, login token, session token, or refresh token.
    def describe_token_get
      to_return = DescribeTokenGet.new(self)
      to_return
    end

    # Find an annotation applied to a persistent entity.
    def annotation_type_uuid_get(type, uuid)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/annotation/{type}/{uuid}", type, uuid)
      to_return
    end

    # Add or replace an annotation applied to a persistent entity. If the value 
    # of <entityReference payloadName='entityAnnotation'> EntityAnnotation</entityReference> 
    # is missing or <code>null</code>, the annotation will be removed. This method 
    # will return the previously-stored annotation, if any.
    def annotation_put(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "PUT", "/api/2/annotation")
      to_return.entity = entity
      to_return
    end

    # Creates a new customer associated with the current <entityReference payloadName='integratorUser'> 
    # IntegratorUser</entityReference>, or returns an existing customer if a matching 
    # customer already exists. The given <entityReference payloadName='userCredentials'> 
    # UserCredentials</entityReference> must include an email, phone, or both. The 
    # following rules will be used to determine if a new customer should be created 
    # <ul> <li>If a customer exists with a matching <b>confirmed</b> email address 
    # or <b>confirmed</b> phone number, that customer will be returned.</li> <li>If 
    # a customer exists that is associated with the current <entityReference payloadName='integratorUser'> 
    # IntegratorUser</entityReference>, and has a matching <b>unconfirmed</b> email 
    # address or <b>unconfirmed</b> phone number, that customer will be returned. 
    # The email check will happen first, and will short-circuit the phone check 
    # if a match is found.</li> <li>Otherwise, a new customer will be created and 
    # associated with your <entityReference payloadName='integratorUser'> IntegratorUser</entityReference>. 
    # The given phone number and email address will be stored as unconfirmed values. 
    # </ul>
    def integrator_customer_post(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "POST", "/api/2/integrator/customer")
      to_return.entity = entity
      to_return
    end

    def integrator_merchant_post(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "POST", "/api/2/integrator/merchant")
      to_return.entity = entity
      to_return
    end

    # Completely destroys all customer data associated with the current integrator 
    # user. This endpoint is only available in the sandbox environment.
    def integrator_destroy_delete
      to_return = Flatpack::Client::FlatpackRequest.new(self, "DELETE", "/api/2/integrator/destroy")
      to_return
    end

    # Returns a list of all merchants managed by the current integrator user
    def integrator_managed_merchants_get
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/integrator/managed/merchants")
      to_return
    end

    # Returns a list of all users the integrator may act as.
    def integrator_managed_users_get
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/integrator/managed/users")
      to_return
    end

    # Updates an existing <entityReference payloadName='customer'> Customer</entityReference> 
    # manageed by the current <entityReference payloadName='integratorUser'> IntegratorUser</entityReference>.
    def integrator_customer_put(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "PUT", "/api/2/integrator/customer")
      to_return.entity = entity
      to_return
    end

    # Returns a sparse payload of all live <entityReference payloadName='merchantLocation'> 
    # locations</entityReference> and their associated <entityReference payloadName='merchant'> 
    # merchants</entityReference>.
    def merchant_locations_get
      to_return = Flatpack::Client::FlatpackRequest.new(self, "GET", "/api/2/merchant/locations")
      to_return
    end

    # Rewards a Customer. This method will implicitly create a <entityReference 
    # payloadName='visit'> Visit</entityReference> which will be returned. The response 
    # will also include any s manipulated by this visit, as well as the customer's 
    # most recent @{link TierTraversal} at the associated @{link Merchant}
    def customer_reward_put(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "PUT", "/api/2/customer/reward")
      to_return.entity = entity
      to_return
    end

    # Rewrites the history of a customer's latest validated visit to a merchant. 
    # The <entityReference payloadName='abstractRewardConfirmation'> AbstractRewardConfirmation</entityReference> 
    # instances associated with the <entityReference payloadName='visitConfirmation'> 
    # VisitConfirmation</entityReference> should reflect the desired state of the 
    # Visit. <p> This method will return the updated Visit.
    def customer_visit_amend_put(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "PUT", "/api/2/customer/visit/amend")
      to_return.entity = entity
      to_return
    end

    # Creates a new outstanding visit for the current customer at the given location. 
    # If the customer has no active Rewards at the associated merchant, a new Reward 
    # will be created for each of the merchant's programs. Information about the 
    # visit, and all active rewards for the associated merchant will be returned.
    def customer_visit_post(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "POST", "/api/2/customer/visit")
      to_return.entity = entity
      to_return
    end

    # Returns a sparse list of visits at the current merchant location that are 
    # un-validated, or that occurred after the time of the most recent validated 
    # visit given. This request must be made with a anonymous clerk role that corresponds 
    # to exactly one MerchantLocation.
    def customer_visit_get
      to_return = CustomerVisitGet.new(self)
      to_return
    end

    # Checks for the validation of an outstanding visit and returns a sparse payload 
    # of <entityReference payloadName='visit'> Visit</entityReference> and related 
    # items.
    def customer_visit_validate_get
      to_return = CustomerVisitValidateGet.new(self)
      to_return
    end

    # Validates a visit
    def customer_visit_put(entity)
      to_return = Flatpack::Client::FlatpackRequest.new(self, "PUT", "/api/2/customer/visit")
      to_return.entity = entity
      to_return
    end

    private

    class DescribeTypeUuidGet < Flatpack::Client::FlatpackRequest

      def initialize(api, *args)
        super(api, "GET", "/api/2/describe/{type}/{uuid}", *args)
      end

      # An ISO8601-formatted datetime that will be used to filter the entities in 
      # the payload's data section to those that were created or updated after the 
      # specified time
      def with_last_modified(last_modified)
        query_parameter('lastModified', last_modified);
      end

    end

    class DescribeTokenGet < Flatpack::Client::FlatpackRequest

      def initialize(api, *args)
        super(api, "GET", "/api/2/describe/token", *args)
      end

      def with_token(token)
        query_parameter('token', token);
      end

    end

    class CustomerVisitGet < Flatpack::Client::FlatpackRequest

      def initialize(api, *args)
        super(api, "GET", "/api/2/customer/visit", *args)
      end

      # By default, requests to this endpoint will hang for a period of time before 
      # returning in order to wait for a visit associated with the location to be 
      # created or updated. Setting this query parameter to <code>true</code> will 
      # disable the hanging get behavior, which is appropriate for requests used 
      # for first-time UI initialization.
      def with_fast_poll(fast_poll)
        query_parameter('fastPoll', fast_poll);
      end

    end

    class CustomerVisitValidateGet < Flatpack::Client::FlatpackRequest

      def initialize(api, *args)
        super(api, "GET", "/api/2/customer/visit/validate", *args)
      end

      def with_most_recent_validated_uuid(most_recent_validated_uuid)
        query_parameter('mostRecentValidatedUuid', most_recent_validated_uuid);
      end

    end


  end
end