require 'kele/version'
require 'kele/errors'
require './lib/roadmap.rb'
require 'httparty'
require 'json'
require 'awesome_print'

class Kele
  include HTTParty
  include Roadmap
  
  base_uri "https://www.bloc.io/api/v1"
  
  def initialize (email, password)
    @auth_token = self.class.post("/sessions", body: {'email': email, 'password': password})['auth_token']
    raise InvalidCredentialsError.new() unless @auth_token 
  end
  
  def get_me
    response = self.class.get("/users/me", headers: { 'authorization' => @auth_token})
    @current_user = JSON.parse(response.body) 
  end
  
  def get_mentor_availability
    mentor_id = get_me["current_enrollment"]["mentor_id"]
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { 'authorization' => @auth_token})
    @mentor_times = JSON.parse(response.body)
  end
  
  def get_messages(page_num = nil)
    if !page_num
      response = self.class.get("/message_threads?", headers: {'authorization' => @auth_token})
      
      (1..((response["count"]/10.to_f).ceil)).map do |p|
        response = self.class.get("/message_threads?", headers: {'authorization' => @auth_token}, body: {"page" => p})
        @messages = JSON.parse(response.body)
      end
    else
      response = self.class.get("/message_threads?", headers: {'authorization' => @auth_token}, body: {"page" => page_num})
      @messages = JSON.parse(response.body)
    end
  end
  
  def create_message(subject, stripped_text, response_token = nil)
    options = {
      headers: {'authorization' => @auth_token},
      body: {
        user_id: get_me["id"],
        recipient_id: get_me["current_enrollment"]["mentor_id"],
        subject: subject,
        "stripped-text": stripped_text
      }
    }
    options[:body][:token] = response_token if response_token  
    response = self.class.post("/messages", options)
    raise InvalidMessageError.new() unless response.code == 200
  end
end
