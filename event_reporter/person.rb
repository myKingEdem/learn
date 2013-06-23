class Person
  attr_reader :personal_info, :contact_info, :address, :rsvp_date

  def initialize(personal_info={}, contact_info={}, address={}, rsvp_date={})
    @personal_info = personal_info
    @contact_info = contact_info
    @address = address
    @rsvp_date = rsvp_date
  end

  def to_s
    @personal_info.each_pair { |key, value| puts "#{ key }: #{ value }" }
    @contact_info.each_pair { |key ,value| puts "#{ key }: #{ value }" }
    @address.each_pair { |key ,value| puts "#{ key }: #{ value }" }
    @rsvp_date.each_pair { |key, value| puts "#{ key }: #{ value }" }
    puts ""
  end
end