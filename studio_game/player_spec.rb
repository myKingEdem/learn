require_relative 'player'
require_relative 'treasure_trove'
require 'rspec/autorun'

describe Player do
  before do
    @initial_life = 100
    @name = "mike"
    @player = Player.new(@name, @initial_life)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq(@name.capitalize)
  end

  it "has an initial life" do
    expect(@player.life).to eq(@initial_life)
  end

  it "has no treasures" do
    expect(@player.points).to eq 0 
  end

  it "has a string representation" do
    expect(@player.to_s).to eq(@player.to_s) #haha
  end

  it "computes a score as a sum of its life and points" do
    score = @initial_life + @player.points
    expect(@player.score).to eq(score)
  end

  it "increases life by 15 when wooted" do
    @player.woot
    expect(@player.life).to eq(@initial_life + 15)
  end

  it "decreases life by 10 when blammed" do
    @player.blam
    expect(@player.life).to eq(@initial_life - 10)
  end

  context "created without an initial life" do
    before { @player = Player.new("sam") }

    it "has a default life of 100" do
      expect(@player.life).to eq(100)
    end
  end

  context "a strong player" do
    before do
      @player = Player.new("Nate", 150)
    end

    it "is strong when life is greater_than_or_equal_to 150" do
      expect(@player).to be_strong 
    end
  end

  context "a wimpy player" do
    before do
      @player = Player.new("Mat", 100)
    end

    it "is a wimpy when life is less_than 150" do
      expect(@player).to_not be_strong
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("mike", 100)
      @player2 = Player.new("dave", 200)
      @player3 = Player.new("danny", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted in decreasing order" do
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end

  context "finds multiple treasures" do
    before do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:crowbar,400))
    end

    it "computes total points as sum of found treasures" do
      expect(@player.points).to eq(550)
    end  
  end 
end
