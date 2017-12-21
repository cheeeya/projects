
require_relative 'piece'
require_relative 'slidingpiece'
require_relative 'steppingpiece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'queen'
require_relative 'knight'
require_relative 'king'
require 'singleton'
require_relative 'nullpiece'
require_relative 'pawn'


class Board
  attr_reader :board

  def initialize
    make_starting_grid()
    @kings = []
    (0..7).each do |idx1|
      (0..7).each do |idx2|
        pos = [idx1, idx2]
        color = "white"
        if [0, 1].include?(idx1)
          color = "black"
        end
        # if [[0, 0], [0, 7], [7, 0], [7, 7]].include?(pos)
        #   self[pos] = Rook.new(pos, self, color)
        # elsif [[0, 1], [0, 6], [7, 1], [7, 6]].include?(pos)
        #   self[pos] = Knight.new(pos, self, color)
        # elsif [[0, 2], [0, 5], [7, 2], [7, 5]].include?(pos)
        #   self[pos] = Bishop.new(pos, self, color)
        if [[7, 4]].include?(pos)
          self[pos] = Queen.new(pos, self, color)
        elsif [[0, 4]].include?(pos)
          king = King.new(pos, self, color)
          self[pos] = king
          @kings << king
        # elsif [1, 6].include?(idx1)
        #   self[pos] = Pawn.new(pos, self, color)
        else
          self[pos] = NullPiece.instance
        end
      end
    end
  end


  def make_starting_grid()
    @board = Array.new(8) {Array.new(8)}
  end

  def [](pos)
    row,col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @board[row][col] = piece
  end

  def in_check?(color)
    if color == "black"
      color = "white"
    else
      color = "black"
    end
    get_pieces(color).each do |piece|
      if piece.moves.include?(@kings.select {|el| el.color != color})
        return true
      else
        return false
      end
    end
  end

  def get_pieces(color)
    @board.flatten.select {|el| el.color == color}
  end


  def checkmate?(color)

  end

  # def display
  #   (0..7).each do |idx1|
  #     (0..7).each do |idx2|
  #       pos = [idx1, idx2]
  #       if self[pos] != nil
  #         print "X"
  #       else
  #         print " "
  #       end
  #     end
  #     puts
  #   end
  # end

  #protected

  class InvalidPieceError < StandardError
    def message
      puts "Nil Piece"
    end
  end

  class InvalidMoveError < StandardError
  end

  def move_piece(start_pos, end_pos)
    raise InvalidPieceError if self[start_pos].nil?
    raise InvalidMoveError unless self[end_pos].nil?

    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil

  end


end
