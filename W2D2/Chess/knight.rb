require_relative "piece"
require_relative "board"

class Knight < Piece

  include SteppingPiece

  KNIGHT_DIFFS = [
    [-2, -1],
    [-2, 1],
    [-1, -2],
    [-1, 2],
    [1, -2],
    [1, 2],
    [2, -1],
    [2, 1]
  ].freeze

  def initialize(pos, board, color)
    super
  end

  def symbol
    if @color == "black"
      "♞"
    else
      "♘"
    end
  end

  protected
  
  def move_diffs
    KNIGHT_DIFFS
  end

end
