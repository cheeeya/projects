require_relative 'card'

class Hand

  attr_reader :hand
  def initialize(hand)
    @hand = hand.sort_by { |card| card.value }
  end

  def get_score
    if straight_flush
      straight_flush
    elsif four_of_a_kind
      four_of_a_kind
    elsif full_house
      full_house
    elsif flush
      flush
    elsif straight
      straight
    elsif trips
      trips
    elsif two_pair
      two_pair
    elsif pair
      pair
    else
      high_card
    end
  end

  private

  def high_card
    @hand.last.value
  end

  def pair
    hash = Hash.new(0)
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.select do |key,val|
      return 14 + key if val == 2
    end
    false
  end

  def two_pair
    hash = Hash.new(0)
    @hand.each do |card|
      hash[card.value] += 1
    end
    keys = []
    hash.select do |key,val|
      keys << key if val == 2
    end
    if keys.count == 2
      return keys.sort.last + 28
    end
    false
  end

  def trips
    hash = Hash.new(0)
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.select do |key,val|
      return 42 + key if val == 3
    end
    false
  end

  def straight
    hand_array = @hand.map { |card| card.value }
    return 56 + hand_array.last if (2..14).to_a.each_cons(5).include?(hand_array)
    false
  end

  def flush
    return 70 + @hand.last.value if @hand.all? { |card| card.suit == @hand[0].suit }
    false
  end

  def full_house
    return 42 + trips if pair && trips
    false
  end

  def four_of_a_kind
    hash = Hash.new(0)
    @hand.each do |card|
      hash[card.value] += 1
    end
    hash.select do |key,val|
      return 98 + key if val == 4
    end
    false
  end

  def straight_flush
    return 56 + straight if straight && flush
    false
  end
end

card0 = Card.new("♠", 2)
card1 = Card.new("♠", 7)
card2 = Card.new("♠", 4)
card3 = Card.new("♠", 3)
card4 = Card.new("♥", 6)

hand = Hand.new([card0,card1,card2,card3,card4])
p hand.get_score
# card1 = Card.new("♠", value)
# card2 = Card.new("♥", value)
# card3 = Card.new("♦", value)
# card4 = Card.new("♣", value)
