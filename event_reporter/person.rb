class Person
  attr_reader :personal_info, :contact_info, :address, :rsvp_date

  def initialize(personal_info={}, contact_info={}, address={}, rsvp_date={})
    @personal_info = personal_info
    @contact_info = contact_info
    @address = address
    @rsvp_date = rsvp_date
  end
end