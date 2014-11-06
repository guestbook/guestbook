class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :login_required

  # The currently authenticated user.
  #
  # Returns a User object or nil.
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  # Set the current user in the session.
  #
  # user - A User object.
  #
  # Returns the user.
  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  # Is a user authenticated?
  #
  # Returns true or false.
  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # Redirect into OAuth flow unless a user is logged in.
  #
  # Returns nothing.
  def login_required
    redirect_to("/auth/github") unless logged_in?
  end

  def admin_required
    redirect_to("/") unless logged_in? && current_user.admin?
  end

  def access_denied
    render status: 401, text: "nice try"
  end
end
