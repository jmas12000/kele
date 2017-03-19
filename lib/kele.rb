require "kele/version"
require "httparty"
require "json"
require "kele/errors"

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'
  
  def initialize (email, password)
    @auth_token = self.class.post("/sessions", body: {"email": email, "password": password})["auth_token"]
    raise InvalidCredentialsError.new() unless @auth_token 
  end
  
  def get_me
    response = self.class.get("/users/me", headers: { "authorization" => @auth_token})
    @current_user = JSON.parse(response.body) 
  end
end
