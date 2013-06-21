require_relative 'person'
personal_info = { first_name: 'first_name', last_name: 'last_name', id: 'id' }
contact_info = { email: 'email@example.com', homephone: '6462171274' }

attendee = Person.new(personal_info, contact_info)
attendees = []
attendees << attendee

person = attendees.select do |a|
  a.personal_info[:last_name] == 'last_name'
end

puts person
