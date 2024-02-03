# Application Controller for my blog app @rubocop
class ApplicationController < ActionController::API
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:create]

  private

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    current_user.present?
  end

  # Method to use in a before_action to require that a user is
  # logged in to access a given route.
  def authenticate_user!
    unless logged_in?
      render json: {error: "You must be logged in to access this section."}, status: :unauthorized
    end
  end
end
