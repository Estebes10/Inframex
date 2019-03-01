class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include ExceptionHandler

  # Confirms a logged-in user.
  def validate_user
    unless logged_in?
      store_location
      redirect_to login_url
    end
  end
end

# Check if a user has a certain privilege (for views)
def has_privilege(user, privilege_id_str)
  if user == nil
    return false
  else
    return user.role.privileges.any? {|h| h[:str_id] == privilege_id_str}
  end
end

def has_privilege_controller(user, privilege_id_str)
  if has_privilege(user, privilege_id_str) == true
    return true
  else
    # store_location
    flash[:info] = "Url no encontrado"
    redirect_to '/404'
  end
end
