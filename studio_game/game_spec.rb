require_relative 'game'
require 'rspec/autorun'

describe Game do
  before do
    @initial_life = 120
    @game_player = Player.new("gamer", @initial_life)

    @game = Game.new("knotgame")
    @game.add_player(@game_player)
    @rounds = 2
  end

  it "woots the player when a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)
    @game.play(@rounds)

    expect(@game_player.life).to eql(@initial_life + (15*2)) 
  end

  it "does not affect life of player when a medium number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)
    @game.play(@rounds)

    expect(@game_player.life).to eql(@initial_life)
  end

  it "blams the player when a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    @game.play(@rounds)

    expect(@game_player.life).to eql(@initial_life - (10*2))
  end

  it "assigns a treasure during each player's turn" do
    @game.play(2)

    expect(@game_player.points).to_not eql(0)
  end
end