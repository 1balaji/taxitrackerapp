class ApiMessage
  attr_accessor :status, :message, :data
  
  def initialize(status, message, data)
    self.status = status
    self.message = message
    self.data = data 
  end
end
