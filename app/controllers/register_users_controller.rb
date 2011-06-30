class RegisterUsersController < ApplicationController
  before_filter :authenticate_admin!
  # GET /register_users
  # GET /register_users.xml
  def index
    @register_users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @register_users }
    end
  end

  # GET /register_users/1
  # GET /register_users/1.xml
  def show
    @register_user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @register_user }
    end
  end

  # GET /register_users/new
  # GET /register_users/new.xml
  def new
    @register_user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @register_user }
    end
  end

  # GET /register_users/1/edit
  def edit
    @register_user = User.find(params[:id])
  end

  # POST /register_users
  # POST /register_users.xml
  def create
    @register_user = User.new(params[:register_user])

    respond_to do |format|
      if @register_user.save
        format.html { redirect_to(@register_user, :notice => 'Register user was successfully created.') }
        format.xml  { render :xml => @register_user, :status => :created, :location => @register_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @register_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /register_users/1
  # PUT /register_users/1.xml
  def update
    @register_user = User.find(params[:id])

    respond_to do |format|
      if @register_user.update_attributes(params[:register_user])
        format.html { redirect_to(@register_user, :notice => 'Register user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @register_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /register_users/1
  # DELETE /register_users/1.xml
  def destroy
    @register_user = User.find(params[:id])
    @register_user.destroy

    respond_to do |format|
      format.html { redirect_to(register_users_url) }
      format.xml  { head :ok }
    end
  end
end
