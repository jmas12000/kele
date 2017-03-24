class InvalidCredentialsError < StandardError
  
  def initialize(msg="invalid email or password")
    super(msg)
  end
end

class InvalidMessageError < StandardError
  
  def initialize(msg="invalid credentials or message")
    super(msg)
  end
end