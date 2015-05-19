class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user
  # after_action :verify_authorized, :except => :index

  private

  # def current_user
  #   @current_user ||=User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  # end

  def current_user
    @current_user ||= lookup_user
  end

  def lookup_user
    if cookies[:auth_token]
      User.find_by_auth_token!(cookies[:auth_token])
    elsif session[:user_id]
      User.find_by_id(session[:user_id])
    end
  end

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?

  end
end
