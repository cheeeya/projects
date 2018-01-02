require_relative "deck"
require_relative "player"
require_relative "hand"

class Game
  attr_reader :players, :deck, :pot, :current_bet, :dealer, :ante

  def initialize(players)
    @deck = Deck.new
    @pot = 0
    @players = players
    deal(@deck, @players)
    @ante = 5
    @current_bet = 0
    @dealer = @players.last
  end

  def play
    @players.each do |player|
      puts player.name
      player.hand.each do |card|
        print "#{card.suit} #{card.value}  "
      end
      puts ""
    end
    round(@ante)
    puts "The pot is #{@pot}"
    round(0)
    current_players = @players.select { |player| player.in_game }
    high_score = 0
    winner = nil
    current_players.each do |player|
      hand = Hand.new(player.hand)
      score = hand.get_score
      if score > high_score
        high_score = score
        winner = player
      end
    end
    puts "#{winner.name} wins! #{high_score}"
  end

  def deal(deck, players)
    (5).times do
      players.each do |player|
        player.hand << deck.deal_card!
      end
    end
  end

  def round(amount)
    @current_bet = amount
    play = true
    while play
      raise_bet = false
      @players.each do |player|
        player.fold if player.wallet < @current_bet
        play = false if player == @dealer && raise_bet == false
        if player.in_game
          puts player.name
          puts "$#{amount}"
          puts "call, raise, or fold"
          case gets.chomp
          when "call"
            @pot += player.call(amount)
          when "raise"
            puts "enter amount to raise"
            @current_bet = player.raise_bet(amount, gets.chomp.to_i)
            @pot += current_bet
            raise_bet = true
          when "fold"
            player.fold

          end
        end
      end
    end
  end
end
players = [Player.new('A', 200), Player.new('B', 200),Player.new('C', 200)]
Game.new(players).play
