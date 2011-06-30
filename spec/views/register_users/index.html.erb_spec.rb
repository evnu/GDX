require 'spec_helper'

describe "register_users/index.html.erb" do
  before(:each) do
    assign(:register_users, [
      stub_model(RegisterUser),
      stub_model(RegisterUser)
    ])
  end

  it "renders a list of register_users" do
    render
  end
end
