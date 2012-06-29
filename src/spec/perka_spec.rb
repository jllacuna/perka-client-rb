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
end
