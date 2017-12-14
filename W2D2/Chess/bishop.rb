require_relative 'piece'
require_relative 'board'

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
  end

  def symbol
    if @color == "black"
      "♝"
    else
      "♗"
    end
  end

  protected
  
  def move_dirs
    diagonal_dirs
  end



end
