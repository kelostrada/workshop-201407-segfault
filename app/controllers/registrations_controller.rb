class RegistrationsController < Devise::RegistrationsController

  # TODO: Please check if below is the best solution for modifying devise

  before_filter :configure_permitted_parameters, :only => [:create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
end