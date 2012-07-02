require 'perka'

puts Perka::VERSION
puts Flatpack::Client::VERSION
puts Flatpack::Core::VERSION

describe Perka::Model do
  it "should pass a smoke test" do
    c = Perka::Model::Customer.new
    c.avatar_url = 'avatar'
    c.first_name = 'Joe'
    c.last_name = 'Stelmach'

    c.avatar_url.should eq('avatar')
    c.first_name.should eq('Joe')
    c.last_name.should eq('Stelmach')
  end
  
  it "builds a flatpack api request" do
    flatpack = nil
    api = Perka::Api.new(flatpack)
    
    api.merchant_search_get().
      with_only_visited('foo foo').
      with_after_uuid('foo').
      execute
    
    d = Perka::Model::MerchantDevice.new
    d.make = 'Apple'
    api.merchant_device_register_put(d).
      with_switch_to_clerk(true).
      execute
      
    api.describe_type_uuid_get('Coupon','uuid').execute
    
  end
end
