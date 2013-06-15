require_relative 'event'
time = Time.now
puts "Event Reporter - #{ time.strftime('%A')}, #{ time.strftime('%m/%d/%Y')} at #{ time.strftime('%I:%M%p')}."

loop do
  puts "Event Name:"
  event_name = gets.chomp
  case event_name
  when /.*/
   event = Event.new(event_name)
   puts event.name
   break
  end
end


