class HomeController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @users = User.all
  end

end
