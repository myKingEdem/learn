require 'csv'
require_relative 'person'

class Event
  attr_reader :name, :attendees
  
  def initialize(name)
    @name = name
    @attendees = []
  end

  def intro_message
    puts "Reporting on #{@name}."
    puts "Enter 'quit' to stop using Event Reporter."
  end

  def run
    command = ''
    unless command == 'quit'
      puts 'Enter Command:'
      input  = gets.chomp
      process_input(input)
    end
  end

  def process_input(input)
    parts = input.split
    command = parts[0]
    case command
    when 'quit' then puts 'Quitting........done!'
    when 'help'
      puts 'pass the input to the help object'
      run
    when 'queue', 'find'
      puts 'pass input to queue object'
      run
    when 'load'
      file_name = parts[-1]
      load(file_name)
      run
    else
      puts "Unknown command: #{ command }"
      run
    end
  end

  def load(file_name)
    puts "loading #{ file_name }........done!"
    CSV.foreach(file_name, headers: true, header_converters: :symbol) do |row|
      personal_info = { id: row[0], first_name: row[:first_name], last_name: row[:last_name] }
      contact_info = { email_address: row[:email_address], homephone: clean_phone_number(row[:homephone]) }
      address = { street: row[:street], city: row[:city], state: row[:state], zipcode: clean_zipcode(row[:zipcode]) }
      rsvp_date = clean_rsvp_date(row[:regdate])
      attendee = Person.new(personal_info, contact_info, address, rsvp_date)
      @attendees << attendee
      puts "#{ @attendees }"
      @attendees.clear
    end
  end

  def clean_phone_number(phone_number)
    phone_number.to_s.gsub!(/[()-.' ',]/,'')
    phone_number = "NONE" if phone_number.length < 10
    phone_number.gsub!(/1/,'') if phone_number.start_with?('1')
    phone_number = "NONE" if phone_number.length > 11
    phone_number
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0').slice(0..4)
  end

  def clean_rsvp_date(rsvp_date)
    day, time = rsvp_date.to_s.split(' ')
    rsvp_date = { day: day, time: time }
  end
end