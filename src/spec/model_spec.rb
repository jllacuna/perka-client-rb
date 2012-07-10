require 'perka'

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
    
    flatpack = Flatpack::Core::Flatpack.new({
      :pretty => false, 
      :verbose => false,
      :entity_module => Perka::Model
    })
    flatpack.packer.pack(c)
  end
  
end
