require_relative 'clumsy_player'
require_relative 'treasure_trove'
require 'rspec/autorun'

describe ClumsyPlayer do
  before do
    @clumsy_player = ClumsyPlayer.new("mike", 120)
  end

  it "only gets half the points value for treasures" do
    expect(@clumsy_player.points).to eql(0)

    hammer = Treasure.new(:hammer, 50)
    3.times { @clumsy_player.found_treasure(hammer) }
    
    expect(@clumsy_player.points).to eql(75)

    crowbar = Treasure.new(:crowbar, 400)
    @clumsy_player.found_treasure(crowbar)

    expect(@clumsy_player.points).to eql(275)
    
  #   yielded = []
  #   @clumsy_player.found_treasures do |treasure|
  #     yielded << treasure
  #   end
  #   expect(yielded).to eql([Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)])
  end
end