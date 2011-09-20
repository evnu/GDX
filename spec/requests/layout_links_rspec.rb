require "spec_helper"
describe "LayoutLinks" do
  describe "GET /layout_links" do
    it "should have a Home page at '/'" do
      get root_path
      response.body.should have_selector('title', :content => "GDX")
    end

    it "should have the right links on the layout" do
      get root_path
      click_link "GDX"
      response.should have_selector 'title', :content => "GDX"
    end

  end
end
