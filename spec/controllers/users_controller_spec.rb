require 'spec_helper'

describe UsersController do
  include Devise::TestHelpers
  render_views

  before :each do
    @user = Factory :user
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    describe "logged in" do
      before :each do
        sign_in @user
      end

      after :each do
        sign_out @user
      end

      it "should have a list of files" do
        get :show, :id => @user.id
        response.body.should have_selector( "h3", :text => "List of Files" )
      end
    end

    describe "not logged in" do
      before :each do
        sign_out @user
      end
      it "should not have a list of files" do
        get :show, :id => @user.id
        response.body.should_not have_selector( "h3", :text => "List of Files" )
      end
    end
  end

end
