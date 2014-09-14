include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds

class ApplicationController < ActionController::API
  private

  def restrict_access
    unless restrict_access_by_header
      render json: {message: 'Invalid API Token'}, status: 401
      return
    end

    @current_user = @api_key.user if @api_key
  end

  def restrict_access_by_header
    authenticate_or_request_with_http_token do |token, options|
   if  ApiKey.exists?(token: token)
     @api_key = ApiKey.find_by_token token
   end
    end
  end
#i cant test bitch
end