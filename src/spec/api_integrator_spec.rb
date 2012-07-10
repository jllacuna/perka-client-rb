require 'perka'

INTEGRATOR_ID = 'e475e342-a542-11e1-9f8d-cde92706a93d'
INTEGRATOR_SECRET = 'integrator'
API_BASE = 'http://localhost'

describe Perka::PerkaApi do
  context "as an integrator user" do
  
    # sets up an api instance for all of our tests to use
    before(:all) do
      @api = Perka::PerkaApi.new({
        :flatpack => Flatpack::Core::Flatpack.new({
          :pretty => true, 
          :verbose => true,
          :entity_module => Perka::Model
        }),
        :server_base => URI.parse(API_BASE),
        :verbose => true
      })
    
    end
  
    # clear out all customer data before each test
    before(:each) do
      @api.integrator_destroy_delete.execute
    end
    
    it "creates a new managed customer" do
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)
      
      cred = Perka::Model::UserCredentials.new({
        :email => 'joe@getperka.com',
        :phone => '+15555555555'
      })
      customer = @api.integrator_customer_post(cred).execute
      
      customer.unconfirmed_email.should eq('joe@getperka.com')
      customer.unconfirmed_phone.should eq('+15555555555')
    
      # another request with the same credentials should yield the same customer
      new_customer = @api.integrator_customer_post(cred).execute
      new_customer.uuid.should eq(customer.uuid)
    
      # another request with the same email and different phone should 
      # also yield the same customer
      cred = Perka::Model::UserCredentials.new({
        :email => 'joe@getperka.com',
        :phone => '+17777777777'
      })
      new_customer = @api.integrator_customer_post(cred).execute
      new_customer.uuid.should eq(customer.uuid)
    
      # similarly, same phone and different email
      cred = Perka::Model::UserCredentials.new({
        :email => 'joe+another@getperka.com',
        :phone => '+15555555555'
      })
      new_customer = @api.integrator_customer_post(cred).execute
      new_customer.uuid.should eq(customer.uuid)
      
      # another request with unique values should yield a new customer
      cred = Perka::Model::UserCredentials.new({
        :email => 'joe+yet_another@getperka.com'
      })
      new_customer = @api.integrator_customer_post(cred).execute
      new_customer.uuid.should_not eq(customer.uuid)
    end
    
    it "rewards punches to a new customer" do
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)
      
      # we'll first create a new customer
      cred = Perka::Model::UserCredentials.new(:email => 'joe+yet_another@getperka.com')
      customer = @api.integrator_customer_post(cred).execute
      
      # determine the merchants associated with this integrator account.
      merchants = @api.integrator_managed_merchants_get.execute
      
      # lets assume this integrator has only one managed merchant
      merchant = merchants.first
      
      # now we'll describe our merchant to take a look at our program data
      merchant = @api.describe_type_uuid_get("merchant",merchant.uuid).execute
      
      program_type = merchant.program_tiers.first.programs.first.program_type
      
      # with one location
      location = merchant.merchant_locations.first
      
      # now we'll switch our session over to a clerk at that location
      @api = @api.oauth_integrator_become("CLERK", location.uuid)
      
      # and assign some punches
      @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 2
          })
        ]
      })).execute
      
    end
  
  end
  
end
