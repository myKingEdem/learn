require 'csv'
require_relative 'person'
require_relative 'queue_processor'
require_relative 'cleaner'

class Event
  attr_reader :name, :attendees
  
  def initialize(name)
    @name = name
    @attendees = []
    @event_queue = QueueProcessor.new
  end

  def intro_message
    puts "Reporting on #{ @name }."
    puts "Enter 'quit' to stop using Event Reporter."
  end

  def run
    command = ''
    unless command == 'quit'
      printf 'Enter Command: '
      input  = gets.chomp
      process_input(input)
    end
  end

  def process_input(input)
    parts = input.split
    command = parts[0]
    case command
    when 'quit' then quit_reporter
    when 'help' then provide_help(input)
    when 'queue', 'find' then process_event_queue(input)
    when 'load' then load_file(parts)
    else
      puts "Unknown command: #{ command }"
      run
    end
  end

  private

  def load_file(parts)
    file_name = parts[1]? parts[1] : 's_event_attendees.csv'
    load(file_name)
    run
  end

  def load(file_name)
    puts "loading #{ file_name }........done!"
    CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|
      personal_info = { id: row[0], first_name: row[:first_name], last_name: row[:last_name] }
      contact_info = { email_address: row[:email_address], 
                           homephone: Cleaner.clean_phone_number(row[:homephone]) }
      address = { street: row[:street], city: row[:city], state: row[:state],
                 zipcode: Cleaner.clean_zipcode(row[:zipcode]) }
      rsvp_date = Cleaner.clean_rsvp_date(row[:regdate])
      
      attendee = Person.new(personal_info, contact_info, address, rsvp_date)
      @attendees << attendee
    end
  end

  def quit_reporter
    @attendees.clear
    puts 'Quitting........done!'
  end

  def provide_help(input)
    puts 'Pass the input to the help object!'
    run
  end

  def process_event_queue(input)
    @event_queue.process_queue(@attendees, input)
    run
  end
end