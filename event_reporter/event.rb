class Event
  attr_reader :name, :attendees
  
  def initialize(name)
    @name = name
    @attendees = []
  end
end