class Player
  attr_reader :life
  attr_accessor :name

  def initialize(name, life=100)
    @name = name.capitalize
    @life = life
    @found_treasures = Hash.new(0)
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts @found_treasures
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def strong?
    @life > 100
  end

  def to_s
    "#{@name.ljust(20,'.')}#{@life}#{score}." 
  end

  def blam
    @life -= 10
    puts "#{@name} got blamed."  
  end

  def woot
    @life += 15
    puts "#{@name} got wooted."
  end

  def score
    @life + points
  end

  def name=(name)
    @name = name.capitalize
  end

  def <=>(other)
    other.score <=> score
  end
end

if __FILE__ == $0
  player = Player.new("larry")
  player.name = "mike"
  player.woot; puts player
  player.blam; puts player
  puts player.score
  puts player.name; puts player.life
end
