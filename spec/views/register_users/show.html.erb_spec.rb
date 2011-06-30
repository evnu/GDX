require 'spec_helper'

describe "register_users/show.html.erb" do
  before(:each) do
    @register_user = assign(:register_user, stub_model(RegisterUser))
  end

  it "renders attributes in <p>" do
    render
  end
end
