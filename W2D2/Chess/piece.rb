
class Piece

  attr_reader :current_position, :color

  def initialize(pos, board, color)
    @current_position = pos
    @board = board
    @color = color
  end

  def to_s
    "X"
  end

  def symbol
  end

  def empty?

  end

  def valid_moves

  end


end
