require 'rspec'
require 'deck'

describe "Deck" do
  subject(:deck){Deck.new}
  
  describe "#initialize" do
    it "has 52 cards" do
      expect(deck.cards.count).to eq(52)
    end
  end

  describe "#deal_card!" do
    it "deals 1 card from the deck" do
      expect(deck.deal_card!.class).to eq(Card)
    end

    it "removes 1 card from the deck" do
      deck.deal_card!
      expect(deck.cards.count).to eq(51)
    end
  end
end
