require_relative 'card'

class Deck

  attr_reader :cards

  def initialize
    @cards = build_deck
    @cards.shuffle!
  end

  def build_deck
    deck = []
    (2..14).each do |value|
      deck << Card.new("♠", value)
      deck << Card.new("♥", value)
      deck << Card.new("♦", value)
      deck << Card.new("♣", value)
    end
    deck
  end

  def deal_card!
    @cards.pop
  end


end
