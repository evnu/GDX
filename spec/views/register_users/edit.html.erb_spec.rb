require 'spec_helper'

describe "register_users/edit.html.erb" do
  before(:each) do
    @register_user = assign(:register_user, stub_model(RegisterUser))
  end

  it "renders the edit register_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => register_users_path(@register_user), :method => "post" do
    end
  end
end
