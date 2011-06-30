# app/controllers/registrations_controller.rb
class Admins::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :cancel ]
  prepend_before_filter :authenticate_scope!, 
    :only => [:create, :new, :edit, :update, :destroy]
  before_filter :authenticate_admin!
end 
