require 'spec_helper'

describe "register_users/new.html.erb" do
  before(:each) do
    assign(:register_user, stub_model(RegisterUser).as_new_record)
  end

  it "renders new register_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => register_users_path, :method => "post" do
    end
  end
end
