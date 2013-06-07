require_relative 'berserk_player'
require 'rspec/autorun'

describe BerserkPlayer do
  before do
    @initial_life = 50 
    @player = BerserkPlayer.new("berserker", @initial_life)
  end
  
  it "does not go berserk when wooted up to 5 times" do
    1.upto(5) { @player.woot }
    
    expect(@player.berserk?).to be_false
  end
  
  it "goes berserk when wooted more than 5 times" do
    1.upto(6) { @player.woot }
  
    expect(@player.berserk?).to be_true 
  end
  
  it "gets wooted instead of blammed when it's gone berserk" do  
    1.upto(6) { @player.woot }
    1.upto(2) { @player.blam }
    
    expect(@player.life).to eql(@initial_life + (8 * 15))
  end
end