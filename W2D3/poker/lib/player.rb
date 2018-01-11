require_relative 'card'

class Player
  attr_accessor :hand
  attr_reader :name, :wallet, :in_game

  def initialize(name, dollars)
    @name = name
    @wallet = dollars
    @hand = []
    @in_game = true
  end


  def call(bet)
    raise "Insufficient funds to call" if bet > @wallet
    @wallet -= bet
    bet
  end

  def raise_bet(bet, bet_raise)
    raise "Insufficient funds to call" if bet > @wallet
    raise "Insufficient funds to raise bet" if bet+bet_raise > @wallet
    @wallet -= bet + bet_raise
    bet + bet_raise
  end

  def fold
    @in_game = false
  end

  def reset
    @in_game = true
  end
end
