require_relative 'player'

class BerserkPlayer < Player
  def initialize(name, life=100)
    super(name, life)
    @woot_count = 0
  end

  def berserk?
    @woot_count > 5
  end

  def woot
    super
    @woot_count += 1
    puts "#{@name} is berserk!" if berserk?
  end

  def blam
    if berserk?
      woot
    else
      super
    end
  end
end