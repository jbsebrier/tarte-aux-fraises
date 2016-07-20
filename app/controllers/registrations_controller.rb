class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    my_profile_path(current_couple.id)
  end
end
