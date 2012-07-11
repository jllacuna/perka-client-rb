require 'perka'

INTEGRATOR_ID = 'e475e342-a542-11e1-9f8d-cde92706a93d'
INTEGRATOR_SECRET = 'integrator'
API_BASE = 'http://localhost'

#INTEGRATOR_ID = 'ab902690-cac3-11e1-9b23-0800200c9a66'
#INTEGRATOR_SECRET = 'foobar'
#API_BASE = 'https://sandbox.getperka.com'

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
        :server_base => API_BASE,
        :verbose => true
      })
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)
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
      
      # By default, API endpoints DO NOT return a full object graph of data.  
      # For example, the above integrator_managed_merchants_get endpoint returns
      # only the merchant with no associated location or program data.  The 
      # describe_type_uuid_get endpoint is an exception to this rule, and will 
      # always peform a deep serialization of the entity being described.  We'll 
      # now describe our merchant to gain access to our location and program data.
      merchant = @api.describe_type_uuid_get("merchant",merchant.uuid).execute
      
      # The merchant's locations should now be populated
      location = merchant.merchant_locations.first
      
      # The program data should also be populated, so we can dig down and grab
      # a program type that we'd like to award points for
      program_type = merchant.program_tiers.first.programs.first.program_type
      
      # now we'll switch our session over to a clerk at the merchant location.
      # This will authorize our API to execute clerk enabled endpoints.
      @api = @api.oauth_integrator_become("CLERK", location.uuid)
      
      # we can now assign some loyalty punches to our new customer
      visit = @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 2
          })
        ]
      })).execute
      
      # A new visit should have been returned describing the transaction.
      # The customer and merchant location should be what we specified
      visit.customer.uuid.should eq(customer.uuid)
      visit.merchant_location.uuid.should eq(location.uuid)
      
      # A new reward should have been advanced by 2 punches
      visit.reward_advancements.length.should eq(1)
      advancement = visit.reward_advancements.first
      advancement.punches_earned.should eq(2)
      
      # The reward should show a sum of only 2 punches since this is a new customer
      advancement.reward.punches_earned.should eq(2)
      
    end
  end
end
