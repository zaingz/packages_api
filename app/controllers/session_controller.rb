class SessionController < ApplicationController
  before_filter :restrict_access, only: [:destroy]

  def create

    if  user=User.find_by_email(params[:email]) || user=User.find_by_username(params[:username])
      if user.authenticate(params[:password]) && user.api_key.nil?
        @current_user = user
        @current_user.create_api_key
        render json: @current_user.api_key.token.to_json, status: 200
      else
        render json: {message: "Password/Token issue"}, status: :unauthorized
      end
    else
      render json: {message: "User doesn't exists"}, status: :unauthorized
    end
    #  render json: @current_user.to_json
  end


  def destroy

  @current_user.api_key.destroy
  head :no_content

  end

end
