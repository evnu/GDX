require 'spec_helper'

describe User do
  before :each do
    @valid_attributes = {:name => "Joe Doe", :email => "auser@domain.org",
      :password => "his password",
      :password_confirmation => "his password" }
  end

  describe :name do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }
  end

  describe :email do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it "should have a valid email address" do
      user = User.new( @valid_attributes.merge( :email => "notvalid" ) )
      user.should_not be_valid
    end
  end

  describe :password do
    it { should validate_presence_of :password }
  end

  describe "relations" do
    it { should have_many :upload }
  end

  describe "usage" do
    it "should be validable" do
      user = User.new( @valid_attributes )
      user.should be_valid
    end
  end
end
