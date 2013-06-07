require_relative 'game'

start_time = Time.now
puts "Start Time: #{start_time.strftime('%A')} #{start_time.strftime('%m/%d/%Y')} – #{start_time.strftime('%I:%M%p')}."

game1 = Game.new("knuckleheads")
game1.load_players(ARGV.shift || "players.csv")
loop do 
  puts "How many rounds?('quit' or 'exit')"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    game1.play(answer.to_i)
    game1.save_high_scores
  when 'quit', 'exit'
    puts "Thanks for playing"
    game1.save_high_scores
    break
  else
    puts "Enter number of rounds or 'quit'"
  end
end
game1.clear_players

