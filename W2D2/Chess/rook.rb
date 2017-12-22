require_relative 'piece'
require_relative 'board'

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    if @color == "black"
      "♜"
    else
      "♖"
    end
  end

  protected
  
  def move_dirs
    horizontal_dirs
  end

end
