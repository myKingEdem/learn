module QueueProcessor
  def self.process_queue(attendees, input)
    @event_attendees = attendees
    @parts = input.split
    @queue = []
    command = @parts[0]
    case command
    when 'find' then process_find_command
    when 'queue' then process_queue_command
    else 
      puts "Unknown command: #{ command }"
    end
  end

  def self.process_queue_command
    command = @parts[1]
    case command
    when 'count' then count
    when 'clear' then clear
    when 'print' then process_print_command
    else 
      puts "Unknown command: #{ command }"
    end
  end

  def self.process_find_command
    puts 'proccessing search......'
  end

  def self.process_print_command
    puts 'processing print....'
    puts @event_attendees
  end

  def self.count
   puts "#{ @queue.count } attendees."
  end

  def self.clear
    @queue.clear
  end
end