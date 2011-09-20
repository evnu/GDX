class UsersController < ApplicationController
  def show
    if params[:id]
      @user = User.find(params[:id])
      @paginated_uploads = Upload.paginate_array @user.upload, params
      @uploads = @user.upload
    else
      flash[:error]  = "No user given"
    end
  end
end
