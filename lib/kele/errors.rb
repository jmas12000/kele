class InvalidCredentialsError < StandardError
  
  def initialize(msg="Invalid email or password")
    super(msg)
  end
end

class InvalidMessageError < StandardError
  
  def initialize(msg="Invalid message submission")
    super(msg)
  end
end

class InvalidCheckpointError < StandardError
  
  def initialize(msg="Invalid checkpoint submission")
    super(msg)
  end
end