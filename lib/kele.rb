require "kele/version"
require "httparty"
require "json"
require "kele/errors"

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'
  
  def initialize (email, password)
    @authorization_token = self.class.post("/sessions", body: {"email": email, "password": password})["auth_token"]
    raise InvalidCredentialsError.new() unless @authorization_token 
  end
end
