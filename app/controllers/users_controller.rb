class UsersController < ApplicationController

  before_filter :restrict_access, except: [:create]

  def index
    render json: @current_user, except: :password_digest
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user.api_key.token.to_json, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = @current_user

    if @user.update(user_params)
      render json: @user, status: :accepted
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @user = @current_user
    @user.destroy

    head :no_content
  end




  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation, :lat, :lon)
  end
end
