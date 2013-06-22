class Person
  attr_reader :personal_info, :contact_info, :address, :rsvp_date

  def initialize(personal_info={}, contact_info={}, address={}, rsvp_date={})
    @personal_info = personal_info
    @contact_info = contact_info
    @address = address
    @rsvp_date = rsvp_date
  end

  def to_s
    @personal_info.each_pair { |k,v| puts "#{ k }: #{ v }" }
    @contact_info.each_pair { |k,v| puts "#{ k}: #{ v }" }
    @address.each_pair { |k,v| puts "#{ k }: #{ v }" }
    @rsvp_date.each_pair { |k,v| puts "#{ k }: #{ v }" }
    puts ""
  end
end