require 'rspec'
require 'card'

describe "Card" do
  subject(:card){Card.new("spade", 13)}
  describe "#initialize" do
    it "creates a card with a suit" do
      expect(card.suit).to eq("spade")
    end

    it "creates a card with a value" do
      expect(card.value).to eq(13)
    end
  end
end
