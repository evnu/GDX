class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @paginated_uploads = Upload.paginate_array @user.upload, params
  end
end
