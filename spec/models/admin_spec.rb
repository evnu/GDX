require 'spec_helper'

describe Admin do
  before :each do
    @valid_attributes = { :name => "Administrator", :email => "root@example.org", :password => "notplease" }
  end

  describe :name do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe :email do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it "should have a valid email address" do
      admin = Admin.new( @valid_attributes.merge( :email => "notvalid" ) )
      admin.should_not be_valid
    end
  end

  describe :password do
    it { should validate_presence_of :password }
    it { should_not == "please" }
  end
end
