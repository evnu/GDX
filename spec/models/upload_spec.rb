require 'spec_helper'

describe Upload do
  it{ should belong_to :user }
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :user }
  it{ should validate_length_of :description }

  before :each do
    # put some elements into the database
    user_attributes = {:name => "Joe Doe", :email => "auser@domain.org",
      :password => "his password",
      :password_confirmation => "his password" }
    @user = User.new user_attributes

    @valid_attributes = { :name => "some uploaded file", :tags => ["tag"], :user => @user,
     :description => "a description"}
  end

  context "Search" do
    before :each do
      @entry1 = Upload.new( @valid_attributes )
      @entry1.save
      @entry2 = Upload.new( @valid_attributes.merge :tags => ["tag", "another tag"] )
      @entry2.save
    end

    it "should be able to upload files" do
      Upload.empty?.should == false
    end

    it "allows to get all uploaded files" do
      Upload.all.should == [@entry1, @entry2]
    end

    it "allows to search by a single tag" do
      Upload.searchByTags( "tag" ).should == [@entry1, @entry2]
    end

    it "allows to search by multiple tags, separated with ','" do
      Upload.searchByTags( "tag, another tag" ).should == [@entry1, @entry2]
    end

    it "returns [] when no entry is found" do
      Upload.searchByTags( "" ).should == []
    end
  end

  describe :description do
    it "should disallow descriptions with more than 500 characters" do
      upload = Upload.new( @valid_attributes.merge( :description => (0...501).map{'A'}.join.to_s ) )
      upload.should_not be_valid
    end

    it "should allow empty descriptions" do
      upload = Upload.new( @valid_attributes.merge( :description => "" ) )
      upload.should be_valid
    end
  end
end
