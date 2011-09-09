require 'spec_helper'

describe "RegisterUsers" do
  describe "GET /register_users" do
    it "should return unauthorized(302) when not logged in as admin" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get register_users_path
      response.status.should be(302)
    end
    pending "should return success(200) when logged in as admin"
  end
end
