require_relative 'piece'
require_relative 'board'

class King < Piece
  include SteppingPiece

  KING_DIFFS = [
    [-1,-1],
    [-1,0],
    [-1,1],
    [0,1],
    [0,-1],
    [1,1],
    [1,0],
    [1,-1],
  ].freeze

  def initialize(pos, board, color)
    super
  end

  def symbol
    if @color == "black"
      "♚"
    else
      "♔"
    end
  end

  protected
  
  def move_diffs
    KING_DIFFS
  end


end
