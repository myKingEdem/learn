module GameTurn
  def self.take_turn(player)
    roll_die
    case
    when @number_rolled < 3
      player.blam
    when @number_rolled < 5
      puts "#{ player.name } got skipped."
    else
      player.woot
    end
    treasure = TreasureTrove.random_treasure
    player.found_treasure(treasure)
  end

  def self.roll_die
    die = Die.new
    @number_rolled = die.roll
  end
end