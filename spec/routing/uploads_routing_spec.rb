require "spec_helper"

describe UploadsController do
  describe "routing" do
    it "routes to #index" do
      get("/uploads").should route_to("uploads#index")
    end

    it "routes to #new" do
      get("/uploads/new").should route_to("uploads#new")
    end

    it "routes to #show" do
      @upload = stub_model(Upload)
      @upload.save
      get("/uploads/#{@upload._id}").should route_to("uploads#show", :id => "#{@upload._id}")
    end

    it "routes to #edit" do
      @upload = stub_model(Upload)
      @upload.save
      get("/uploads/#{@upload._id}/edit").should route_to("uploads#edit", :id => "#{@upload._id}")
    end

    it "routes to #create" do
      post("/uploads/").should route_to("uploads#create")
    end

    it "routes to #update" do
      @upload = stub_model(Upload)
      @upload.save
      put("/uploads/#{@upload._id}").should route_to("uploads#update", :id => "#{@upload._id}")
    end

    it "routes to #destroy" do
      @upload = stub_model(Upload)
      @upload.save
      delete("/uploads/#{@upload._id}").should route_to("uploads#destroy", :id => "#{@upload._id}")
    end
  end
end
