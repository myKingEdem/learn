require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

time = Time.now
puts time.strftime('Event Manager - %m/%d/%Y, %I:%M%p')

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0').slice(0..4)
end

def clean_phone_number(phone_number)
  phone_number.to_str.gsub!(/[()-.' ',]/,'')
  phone_number = "NONE" if phone_number.length < 10
  phone_number.gsub!(/1/,'') if phone_number.start_with?('1')
  phone_number = "NONE" if phone_number.length > 11
  phone_number
end

def legislators_names(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exists?('output')
  filename = "output/thanks_#{id}.html"
  File.open(filename, "w") { |file| file.puts form_letter  }
end

#Begins here! Change event_attendees.csv to manage new attendees.
contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)
template_letter = File.read('form_letter.erb')
erb_template = ERB.new(template_letter)

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone_number = clean_phone_number(row[:homephone])
  legislators = legislators_names(zipcode)
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id,form_letter)
 
  puts "#{name} #{zipcode} #{phone_number}"
end