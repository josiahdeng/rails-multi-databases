class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized

  def pundit_user
    current_user
  end

  def admin_not_authorized
    flash[:error] = "无权限"
    redirect_to blog_index_path
  end
end
