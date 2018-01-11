require 'rspec'
require 'hand'

describe "Hand" do
  # deck << Card.new("♠", value)
  # deck << Card.new("♥", value)
  # deck << Card.new("♦", value)
  # deck << Card.new("♣", value)
  let(:clubs4) { double("clubs4", value: 4, suit: "♣") }
  let(:clubs5) { double("clubs5", value: 5, suit: "♣") }
  let(:clubs6) { double("clubs6", value: 6, suit: "♣") }
  let(:clubs7) { double("clubs7", value: 7, suit: "♣") }
  let(:clubs8) { double("clubs8", value: 8, suit: "♣") }
  subject(:hand) { Hand.new([clubs4, clubs4, clubs6, clubs7, clubs8])}

  describe "#initialize" do
    it "starts with hand of 5 cards" do
      expect(hand.hand.length).to eq(5)
    end
  end
end
