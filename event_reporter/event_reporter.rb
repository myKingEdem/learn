require_relative 'event'
time = Time.now
puts "Event Reporter - #{ time.strftime('%A')}, #{ time.strftime('%m/%d/%Y')} at #{ time.strftime('%I:%M%p')}."

loop do
  puts "Event Name:"
  event_name = gets.chomp
  case event_name
  when /.*/
    @event = Event.new(event_name)
    puts @event.intro_message
    @event.run
    puts "Thanks for using Event Reporter."
    break
  end
end