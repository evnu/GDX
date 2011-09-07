require 'spec_helper'

describe RegisterUsersController do
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all register_users as @register_users" do
      register_user = RegisterUser.create! valid_attributes
      get :index
      assigns(:register_users).should eq([register_user])
    end
  end

  describe "GET show" do
    it "assigns the requested register_user as @register_user" do
      register_user = RegisterUser.create! valid_attributes
      get :show, :id => register_user.id.to_s
      assigns(:register_user).should eq(register_user)
    end
  end

  describe "GET new" do
    it "assigns a new register_user as @register_user" do
      get :new
      assigns(:register_user).should be_a_new(RegisterUser)
    end
  end

  describe "GET edit" do
    it "assigns the requested register_user as @register_user" do
      register_user = RegisterUser.create! valid_attributes
      get :edit, :id => register_user.id.to_s
      assigns(:register_user).should eq(register_user)
    end
  end

  describe "POST create" do
    pending "must be logged in as administrator"

    describe "with valid params" do
      it "creates a new RegisterUser" do
        expect {
          post :create, :register_user => valid_attributes
        }.to change(RegisterUser, :count).by(1)
      end

      it "assigns a newly created register_user as @register_user" do
        post :create, :register_user => valid_attributes
        assigns(:register_user).should be_a(RegisterUser)
        assigns(:register_user).should be_persisted
      end

      it "redirects to the created register_user" do
        post :create, :register_user => valid_attributes
        response.should redirect_to(RegisterUser.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved register_user as @register_user" do
        # Trigger the behavior that occurs when invalid params are submitted
        RegisterUser.any_instance.stub(:save).and_return(false)
        post :create, :register_user => {}
        assigns(:register_user).should be_a_new(RegisterUser)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RegisterUser.any_instance.stub(:save).and_return(false)
        post :create, :register_user => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested register_user" do
        register_user = RegisterUser.create! valid_attributes
        # Assuming there are no other register_users in the database, this
        # specifies that the RegisterUser created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RegisterUser.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => register_user.id, :register_user => {'these' => 'params'}
      end

      it "assigns the requested register_user as @register_user" do
        register_user = RegisterUser.create! valid_attributes
        put :update, :id => register_user.id, :register_user => valid_attributes
        assigns(:register_user).should eq(register_user)
      end

      it "redirects to the register_user" do
        register_user = RegisterUser.create! valid_attributes
        put :update, :id => register_user.id, :register_user => valid_attributes
        response.should redirect_to(register_user)
      end
    end

    describe "with invalid params" do
      it "assigns the register_user as @register_user" do
        register_user = RegisterUser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RegisterUser.any_instance.stub(:save).and_return(false)
        put :update, :id => register_user.id.to_s, :register_user => {}
        assigns(:register_user).should eq(register_user)
      end

      it "re-renders the 'edit' template" do
        register_user = RegisterUser.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RegisterUser.any_instance.stub(:save).and_return(false)
        put :update, :id => register_user.id.to_s, :register_user => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested register_user" do
      register_user = RegisterUser.create! valid_attributes
      expect {
        delete :destroy, :id => register_user.id.to_s
      }.to change(RegisterUser, :count).by(-1)
    end

    it "redirects to the register_users list" do
      register_user = RegisterUser.create! valid_attributes
      delete :destroy, :id => register_user.id.to_s
      response.should redirect_to(register_users_url)
    end
  end

end
