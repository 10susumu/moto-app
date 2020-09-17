module AuthHelper
  def http_login
    username = "susumu"
    password = "2222"
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username,password)
  end
end