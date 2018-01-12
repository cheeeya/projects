
require_relative 'piece'
class Board
  attr_reader :board
  def initialize
    make_starting_grid()
    (0..7).each do |idx1|
      (0..7).each do |idx2|
        pos = [idx1, idx2]
        if idx1 < 2 || idx1 > 5
          self[pos] = Piece.new
        else
          self[pos] = nil
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
