class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include ExceptionHandler
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
  if active_user?
    # if user is valid (active and logged in), check privilege.
    if has_privilege(user, privilege_id_str)
      return true
    else
      # if user does not have privilege, send to 404
      flash[:info] = "Url no encontrado"
      redirect_to('/404')
      return false
    end
  else
    log_out if logged_in?
    redirect_to(root_url)
  end
end

def belongs_to_project_controller(user, project_id)
  # if project exists and (user can see all projects or user is assigned to that project)
  if Project.exists?(project_id) && (has_privilege(user, "project_7") || Project.find(project_id).users.exists?(user.id))
    return true
  else
    # store_location
    flash[:info] = "Url no encontrado"
    redirect_to '/404'
    return false
  end
end
