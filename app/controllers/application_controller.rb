class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_user_authenticated

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private
  def ensure_user_authenticated
    if current_user.nil?
      redirect_to :root
    end
  end
end
