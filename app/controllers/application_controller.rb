class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin_user
      new_admin_admin_user_session_path
    else
      new_user_session_path
    end
  end
end