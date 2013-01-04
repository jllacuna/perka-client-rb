require 'perka'

#INTEGRATOR_ID = 'e475e342-a542-11e1-9f8d-cde92706a93d'
#INTEGRATOR_SECRET = 'integrator'
#API_BASE = 'http://localhost'

INTEGRATOR_ID = '44ff7a20-cb63-11e1-9b23-0800200c9a66'
INTEGRATOR_SECRET = 'foobar'
API_BASE = 'https://sandbox.getperka.com'

RSpec.configure do |c|
  c.fail_fast = true
end

describe Perka::PerkaApi do
  context "as an integrator user" do
  
    # sets up an api instance for all of our tests to use
    before(:all) do
      @api = Perka::PerkaApi.new({
        :flatpack => Flatpack::Core::Flatpack.new({
          :pretty => true, 
          :verbose => false,
          :entity_module => Perka::Model
        }),
        :server_base => API_BASE,
        :verbose => false 
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
      merchant = @api.describe_entity_get(merchant).execute
      
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
      
      # We'll now pull down the customer's reward status
      rewards = @api.customer_uuid_get(customer.uuid).execute.rewards
      
      # We should have only one non-activated, non-redeemed reward with 2 punches
      rewards.length.should eq(1)
      rewards.first.activated_at.should be_nil
      rewards.first.redeemed_at.should be_nil
      rewards.first.punches_earned.should eq(2)
      
      # Now we'll give the customer another 9 punches, which should activate the 
      # reward and make it available for redemption, and will create another 
      # reward with a single punch
      @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 9
          })
        ]
      })).execute
      
      # The customer should now one activated, and one non-activated reward
      rewards = @api.customer_uuid_get(customer.uuid).execute.rewards
      rewards.length.should eq(2)
      active_reward = rewards.detect {|r| r.activated_at }
      active_reward.activated_at.should_not be_nil
      active_reward.redeemed_at.should be_nil
      active_reward.punches_earned.should eq(10)
      
      inactive_reward = rewards.detect {|r| !r.activated_at }
      inactive_reward.activated_at.should be_nil
      inactive_reward.redeemed_at.should be_nil
      inactive_reward.punches_earned.should eq(1)
      
      # We'll now redeem the active reward.  We can also award 
      # more punches in the same transaction
      @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::RedemptionRewardConfirmation.new({
            :reward => active_reward
          }),
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 1
          })
        ]
      })).execute
      
      # The customer status should now show just one non-active 
      # reward with 2 punches
      rewards = @api.customer_uuid_get(customer.uuid).execute.rewards
      rewards.length.should eq(1)
      rewards.first.activated_at.should be_nil
      rewards.first.redeemed_at.should be_nil
      rewards.first.punches_earned.should eq(2)
    end

    it "determines the status of an existing customer" do
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)

      # set up our existing customer
      cred = Perka::Model::UserCredentials.new(:email => 'joe@getperka.com')
      existing_customer = @api.integrator_customer_post(cred).execute

      # switch over to a clerk at the first location
      merchants = @api.integrator_managed_merchants_get.execute
      merchant = @api.describe_entity_get(merchants.first).execute
      location = merchant.merchant_locations.first
      @api = @api.oauth_integrator_become("CLERK", location.uuid)

      # fetch our customer. The customer_uuid_get endpoint will
      # populate the resulting customer with reward, tier_traversal, and 
      # available coupon information
      customer = @api.customer_uuid_get(existing_customer.uuid).execute

      # since this customer doesn't have any visits yet, there should be
      # no tier_traversal or reward information
      customer.tier_traversals.should be_nil
      customer.rewards.should be_nil

      # let's go ahaead and create a visit
      program_type = merchant.program_tiers.first.programs.first.program_type
      visit = @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 1
          })
        ]
      })).execute

      # Note that since the most recent tierTraversal can be expected in the 
      # response, the visit can be used to check the customer's current status
      # at the merchant. In this case, our customer should be in the 
      # lowest 'local' tier.  We do a simple name comparison here, but if you
      # need to verify that a customer belongs to a particular tier, the tier 
      # should be compared against one of those returned from a 
      # describe_entity_get(merchant) request.
      visit.customer.tier_traversals.length.should eq(1)
      visit.customer.tier_traversals.first.program_tier.name.should eq('local')

      # We'll make another round trip to the server to ensure we can
      # now access the customer's most recent tier traversal for the 
      # merchant associated with the current session
      customer = @api.customer_uuid_get(existing_customer.uuid).execute
      customer.tier_traversals.length.should eq(1)
      customer.tier_traversals.first.program_tier.name.should eq('local')
      customer.tier_traversals.first.program_tier.merchant.uuid.should eq(merchant.uuid)
    end

    it "amends a visit" do
      # set up a existing customer
      cred = Perka::Model::UserCredentials.new(:email => 'joe@getperka.com')
      customer = @api.integrator_customer_post(cred).execute

      # switch over to a clerk at location_one
      merchants = @api.integrator_managed_merchants_get.execute
      merchant = @api.describe_entity_get(merchants.first).execute
      location_one = merchant.merchant_locations.first
      @api = @api.oauth_integrator_become("CLERK", location_one.uuid)

      # assign some punches
      program_type = merchant.program_tiers.first.programs.first.program_type
      visit = @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 1
          })
        ]
      })).execute

      # confirm that we have one reward with a single punch 
      # obtained at location_one.
      visit.customer.rewards.length.should eq(1)
      visit.customer.rewards.first.punches_earned.should eq(1)
      visit.reward_advancements.length.should eq(1)
      visit.reward_advancements.first.punches_earned.should eq(1)
      visit.merchant_location.uuid.should eq(location_one.uuid)

      # We can now edit the visit to change the number of punches given.
      # This operation re-writes the history of the visit, so the payload
      # must represent the new state in its entirety, even if some 
      # data remains the same.  Also note that the visit given MUST be 
      # the customers most recent visit.
      amended_visit = @api.customer_visit_amend_put(Perka::Model::VisitConfirmation.new({
        :visit => visit,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 3
          })
        ]
      })).execute

      # confirm that we still have only 1 reward, but that the reward
      # now has 3 punches instead of 1
      amended_visit.customer.rewards.length.should eq(1)
      amended_visit.customer.rewards.first.punches_earned.should eq(3)
      amended_visit.reward_advancements.length.should eq(1)
      amended_visit.reward_advancements.first.punches_earned.should eq(3)
      amended_visit.merchant_location.uuid.should eq(location_one.uuid)

      # In certain situations, we may also want to change the location 
      # where the visit occurred.  In order to do this, we need to upgrade
      # our role to a merchant user, since the clerk's access is limited 
      # to the location they're assigned to
      manager = merchant.merchant_users.first
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)
      @api = @api.oauth_integrator_become("MERCHANT", manager.uuid)

      # swap the visit's location out for another one
      location_two = merchant.merchant_locations.last
      location_two.uuid.should_not eq(location_one.uuid)
      amended_visit.merchant_location = location_two

      # then request for the vist to be amended again.  Remember, we need to
      # pass up the entire new state of the visit here, so we could change
      # the number of punches given again
      new_amended_visit = @api.customer_visit_amend_put(Perka::Model::VisitConfirmation.new({
        :visit => amended_visit,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 4
          })
        ]
      })).execute

      # ensure that the visit was in fact moved to the new location, and that
      # the punch count was updated again
      new_amended_visit.merchant_location.uuid.should eq(location_two.uuid)
      new_amended_visit.customer.rewards.length.should eq(1)
      new_amended_visit.customer.rewards.first.punches_earned.should eq(4)
      new_amended_visit.reward_advancements.length.should eq(1)
      new_amended_visit.reward_advancements.first.punches_earned.should eq(4)
    end
    
    it "annotate entities with arbitrary JSON data" do
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)
      
      # first we'll grab a reference to one of our managed merchants
      merchants = @api.integrator_managed_merchants_get.execute
      merchant = merchants.first
      
      # then apply an arbitrary annotation to the merchant
      json = "{'foo':'bar'}"
      @api.annotation_put(Perka::Model::EntityAnnotation.new({
        :annotation => json,
        :entity => merchant
      })).execute
      
      # which can be retreived at any time
      annotation = @api.annotation_entity_get(merchant).execute
      annotation.annotation.should eq(json)

      # now we'll update our annotation to a new value
      json = "{'bar':'baz'}"
      @api.annotation_put(Perka::Model::EntityAnnotation.new({
        :annotation => json,
        :entity => merchant
      })).execute
      
      # and verify the update
      annotation = @api.annotation_entity_get(merchant).execute
      annotation.annotation.should eq(json)

      # let's also attempt to annotate an entity with at least one embedded property 
      merchant = @api.describe_entity_get(merchant).execute
      location = merchant.merchant_locations.first
      json = "{'foo':'bar'}"
      @api.annotation_put(Perka::Model::EntityAnnotation.new({
        :annotation => json,
        :entity => location
      })).execute
      
      # which can be retreived at any time
      annotation = @api.annotation_entity_get(location).execute
      annotation.annotation.should eq(json)
    end

    it "redeems a coupon" do
      @api.oauth_integrator_login(INTEGRATOR_ID, INTEGRATOR_SECRET)

      # set up our existing customer
      cred = Perka::Model::UserCredentials.new(:email => 'joe@getperka.com')
      customer = @api.integrator_customer_post(cred).execute

      # switch over to a clerk at the first location, and describe 
      # our merchant
      merchants = @api.integrator_managed_merchants_get.execute
      merchant = @api.describe_entity_get(merchants.first).execute
      location = merchant.merchant_locations.first
      @api = @api.oauth_integrator_become("CLERK", location.uuid)

      # each merchant location may have a set of coupon visibilites 
      # enabling coupon(s) to be redeemed at that location.  This
      # particular merchant has been set up with a standard coupon
      # available to any customer visiting any of their locations.
      available_coupons = location.coupon_visibilities.map {|cv| cv.coupon}
      available_coupons.length.should eq(1)
      coupon = available_coupons.first

      # we can now specify that this coupon should be redeemed when 
      # validating a visit.  We can also pass along some punches
      # earned to be recoreded in the same transaction
      program_type = merchant.program_tiers.first.programs.first.program_type
      visit = @api.customer_reward_put(Perka::Model::RewardGrant.new({
        :customer => customer,
        :reward_confirmations => [
          Perka::Model::PunchRewardConfirmation.new({
            :program_type => program_type,
            :punches_earned => 1
          }),
          Perka::Model::RedemptionCouponConfirmation.new({
            :coupon => coupon
          })
        ]
      })).execute

      # confirm that the coupon has been redeemed by
      # looking for an appropriate coupon redemption
      # within the resulting visit
      visit.coupon_redemptions.length.should eq(1)
      coupon_redemption = visit.coupon_redemptions.first
      coupon_redemption.coupon.uuid.should eq(coupon.uuid)

      # our punches should be present 
      visit.merchant_location.uuid.should eq(location.uuid)
      visit.customer.rewards.length.should eq(1)
      visit.customer.rewards.first.punches_earned.should eq(1)
      visit.reward_advancements.length.should eq(1)
      visit.reward_advancements.first.punches_earned.should eq(1)
    end
  end
end
