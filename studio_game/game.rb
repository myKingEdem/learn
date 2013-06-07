require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title
  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def clear_players
    @players.clear
  end

  def play(round)
    print_players
    print_treasures
    1.upto(round) do |r|
      puts "Round #{r}:"
      @players.each { |p| GameTurn.take_turn(p) }
    end
    print_stats
  end

  def print_players
    puts "There are #{@players.size} players in #{@title}:"
    @players.each { |p| puts p }
  end

  def print_treasures
    treasures = TreasureTrove::TREASURES
    puts "There are #{ treasures.size} treasures in #{@title}:"
    treasures.each { |t| puts "#{ t.name }....#{ t.points} points" }
  end

  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong? }
    puts "****#{@title} Stats****"
    puts "Strong:"
    strong_players.each { |p| puts p }
    puts "Wimpy:"
    wimpy_players.each { |p| puts p }
    high_scores
  end

  def high_scores
    puts "#{@title} High Scores"
    @players.sort.each do |p|
      puts "#{ p.name.ljust(20,'.')}#{p.score}"
    end
  end

  def load_players(players_file)
    File.foreach(players_file) do |line|
      name, life = line.split(',')
      player = Player.new(name, Integer(life))
      add_player(player)
    end
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores"
      file.puts high_scores
    end
  end
end

if __FILE__ == $0
  game = Game.new("my_fav")
  game_player = Player.new("mike", 120)
  player2 = Player.new("sam", 120)
  game.add_player(game_player)
  game.add_player(player2)
  game.play(2)
  game.clear_players
end
