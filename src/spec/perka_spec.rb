require 'perka'

puts Perka::VERSION
puts Flatpack::Client::VERSION
puts Flatpack::Core::VERSION

describe Perka::Model do
  it "should pass a smoke test" do
    c = Perka::Model::Customer.new({
      :avatar_url => 'avatar',
      :first_name => 'Joe',
      :junk => 'junk'
    })
    c.last_name = 'Stelmach'
    puts c.inspect

    c.avatar_url.should eq('avatar')
    c.first_name.should eq('Joe')
    c.last_name.should eq('Stelmach')
  end
  
  it "builds a flatpack api request" do
    flatpack = nil
    api = Perka::Api.new(flatpack)
    api.server_base = URI.parse('http://localhost')
    puts api.server_base.request_uri
    
    cred = Perka::Model::UserCredentials.new({
      :email => 'joe@getperka.com',
      :password => 'foo'
    })
    res = api.customer_login_post(cred).execute
    
    puts res
  end
end
