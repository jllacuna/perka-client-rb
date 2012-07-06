require 'perka'

INTEGRATOR_ID = 'e475e342-a542-11e1-9f8d-cde92706a93d'

describe Perka::Model do
  it "should pass a smoke test" do
    c = Perka::Model::Customer.new({
      :avatar_url => 'avatar',
      :first_name => 'Joe',
      :junk => 'junk'
    })
    c.last_name = 'Stelmach'

    c.avatar_url.should eq('avatar')
    c.first_name.should eq('Joe')
    c.last_name.should eq('Stelmach')
    
    conf = Flatpack::Core::Configuration.new({
      :pretty => false, 
      :verbose => false,
      :entity_module => Perka::Model
    })
    flatpack = Flatpack::Core::Flatpack.new(conf)
    flatpack.packer.pack(c)
  end
  
  it "performs auth" do
    conf = Flatpack::Core::Configuration.new({
      :pretty => false, 
      :verbose => false,
      :entity_module => Perka::Model
    })
    flatpack = Flatpack::Core::Flatpack.new(conf)
    api = Perka::PerkaApi.new(flatpack)
    api.server_base = URI.parse('http://localhost')
    api.oauth_integrator_login(INTEGRATOR_ID, "integrator")
    
    cred = Perka::Model::UserCredentials.new({
      :email => 'joe_rspec@getperka.com',
      :password => 'foo'
    })
    customer = api.integrator_customer_post(cred).execute
    puts customer.inspect
    
  end
  
end
