require 'kele/version'
require 'kele/errors'
require './lib/roadmap.rb'
require 'httparty'
require 'json'
require 'awesome_print'

class Kele
  include HTTParty
  include Roadmap
  
  def initialize (email, password)
    @auth_token = self.class.post(base_uri("/sessions"), body: {'email': email, 'password': password})['auth_token']
    raise InvalidCredentialsError.new() unless @auth_token 
  end
  
  def get_me
    response = self.class.get(base_uri("/users/me"), headers: { 'authorization' => @auth_token})
    @current_user = JSON.parse(response.body) 
  end
  
  def get_mentor_availability(mentor_id)
    response = self.class.get(base_uri("/mentors/#{mentor_id}/student_availability"), headers: { 'authorization' => @auth_token})
    @mentor_times = JSON.parse(response.body)
  end
  
  private
  
  def base_uri(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
