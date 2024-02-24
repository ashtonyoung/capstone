class SessionsController < ApplicationController
  # "Create" a login, aka "log the user in"
  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:current_user_id] = user.id
      @_current_user = user
      render json: {success: "User logged in", user: user}, status: :accepted
    else
      render json: {error: "Invalid username or password."}, status: :unauthorized
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    session.delete(:current_user_id)
    # Clear the memoized current user
    @_current_user = nil
  end

  def index
    if logged_in?
      render json: {logged_in: true, user: current_user}, status: :ok
    else
      render json: {logged_in: false}, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
