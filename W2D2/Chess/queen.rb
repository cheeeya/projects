require_relative 'board'
require_relative 'piece'

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    if @color == "black"
      "♛"
    else
      "♕"
    end
  end

  protected
  
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end
