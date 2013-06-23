class QueueProcessor
  def initialize
    @event_attendees = []
    @queue = []
  end

  def process_queue(attendees, input)
    @event_attendees = attendees
    @parts = input.split
    command = @parts[0]
    case command
    when 'find' then process_find_command
    when 'queue' then process_queue_command
    else 
      puts "Unknown command: #{ command }"
    end
  end

  def process_queue_command
    command = @parts[1]
    case command
    when 'count' then count
    when 'clear' then clear
    when 'print' then process_print_command
    when 'save'  then process_save_command
    else 
      puts "Unknown command: #{ command }"
    end
  end

  def process_find_command
    criteria = @parts[1]
    value = @parts[2]
    case criteria
    when 'first_name', 'last_name', 'id' then find_by_personal_info(criteria, value)
    when 'email_address', 'homephone' then find_by_contact_info(criteria, value)
    when 'state', 'city', 'zipcode' then find_by_address(criteria, value) 
    else 
      puts "No one matches your search criteria." 
    end
  end

  def find_by_personal_info(criteria, value)
    clear
    persons = @event_attendees.select do |attendee| 
      attendee.personal_info[criteria.to_sym] == value.to_s
    end

    persons.each { |person| @queue << person }
  end

  def find_by_contact_info(criteria, value)
    clear
    persons = @event_attendees.select do |attendee|
      attendee.contact_info[criteria.to_sym] == value.to_s
    end

    persons.each { |person| @queue << person }
  end

  def find_by_address(criteria, value)
    clear
    persons = @event_attendees.select do |attendee|
      attendee.address[criteria.to_sym] == value.to_s
    end

    persons.each { |person| @queue << person }
  end

  def process_print_command
    @queue.each { |p| puts p.to_s }
  end

  def process_save_command
    puts "saving to...."
  end

  def count
   puts "#{ @queue.count } attendees."
  end

  def clear
    @queue.clear
  end
end