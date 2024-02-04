class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    # probably not useful but keeping until I need to change it
    render json: @users.map { |u| {**u.as_json, url: user_url(u, format: :json)} }
  end

  # GET /users/1
  def show
    render json: @user.as_json(include_nil_values: true)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      @_current_user = @user
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      %i[
        handle
        email
        password
        first_name
        last_name
      ]
    )
  end
end
