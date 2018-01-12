require 'rspec'
require 'player'

describe "Player" do
  subject(:player) { Player.new("charles", 200)}
  describe "#initialize" do
    it "creates a player with a name" do
      expect(player.name).to eq("charles")
    end

    it "creates an empty hand" do
      expect(player.hand).to be_empty
    end

    it "starts the player with a given wallet" do
      expect(player.wallet).to eq(200)
    end
  end

  describe "#call" do
    it "deducts the bet from the player" do
      player.call(5)
      expect(player.wallet).to eq(195)
    end

    it "doesn't allow player to call if bet > wallet" do
      expect{player.call(205)}.to raise_error("Insufficient funds to call")
    end

    it "returns amount of the bet" do
      expect(player.call(5)).to eq(5)
    end
  end

  describe "#raise" do
    it "returns an increased bet" do
      expect(player.raise_bet(5, 5)).to eq(10)
    end

    it "raises an error if player has insufficient funds to call" do
      expect{ player.raise_bet(205, 5)}.to raise_error("Insufficient funds to call")
    end

    it "raises an error if player has insufficient funds to raise" do
      expect{ player.raise_bet(200, 5)}.to raise_error("Insufficient funds to raise bet")
    end
  end

  describe "#fold" do
    it "player folds" do
      player.fold
      expect(player.in_game).to eq(false)
    end
  end

  describe "#reset" do
    it "puts player back in game" do
      player.fold
      player.reset
      expect(player.in_game).to eq(true)
    end
  end
end
