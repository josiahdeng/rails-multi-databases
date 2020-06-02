class UserSessionController < Devise::SessionsController
  def after_sign_in_path_for
    blog_path
  end
end