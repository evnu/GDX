require "spec_helper"

describe RegisterUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/register_users").should route_to("register_users#index")
    end

    it "routes to #new" do
      get("/register_users/new").should route_to("register_users#new")
    end

    it "routes to #show" do
      get("/register_users/1").should route_to("register_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/register_users/1/edit").should route_to("register_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/register_users").should route_to("register_users#create")
    end

    it "routes to #update" do
      put("/register_users/1").should route_to("register_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/register_users/1").should route_to("register_users#destroy", :id => "1")
    end

  end
end
