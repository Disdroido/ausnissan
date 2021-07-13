class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  load_and_authorize_resource

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  def create
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    respnd_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'You successfully updated your profile.' }
      else
        format.html { render :edit }
      end
    end
  end

  def admin_update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                            @user.update(user_params)
                          else
                            @user.update_without_password(user_params)
                          end

    if successfully_updated
      redirect_to admin_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def needs_password?(_user, params)
      params[:password].present?
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(        
        :email,
        :password,
        :password_confirmation,
        :name,
        :role_id
      )
    end
end
