require_relative 'piece'
class Pawn < Piece


  PAWN_MOVE = [
    [-1, 0]
  ].freeze

  PAWN_ATTACK = [
    [-1, -1],
    [-1, 1]
  ].freeze


  PAWN_PUSH = [
    [-2, 0]
  ].freeze

  def initialize(pos, board, color)
    super
  end

  def symbol
    if @color == "black"
      "♟"
    else
      "♙"
    end
  end

  def moves
    poss_moves = []
    x, y = @current_position
    forward_steps.each do |dxdy|
      dx, dy = dxdy
      new_x, new_y = (x + dx), (y + dy)
      if new_x.between?(0, 7) && new_y.between?(0, 7)
        new_pos = [new_x, new_y]
        if @board[new_pos].class == NullPiece
          poss_moves << new_pos
        end
      end
    end
    side_attacks.each do |dxdy|
      dx, dy = dxdy
      new_x, new_y = (x + dx), (y + dy)
      if new_x.between?(0, 7) && new_y.between?(0, 7)
        new_pos = [new_x, new_y]
        if !@board[new_pos].color.nil? && @board[new_pos].color != self.color
          poss_moves << new_pos
        end
      end
    end
    poss_moves
  end

  def at_start_row?
    (@color == "white" && @current_position[0] == 6) ||
    (@color == "black" && @current_position[0] == 1)
  end

  def forward_dir (diff)
    if @color == "white"
      diff
    else
      convert_color(diff)
    end
  end

  def forward_steps
    if at_start_row?
      forward_dir(PAWN_PUSH + PAWN_MOVE)
    else
      forward_dir(PAWN_MOVE)
    end
  end

  def side_attacks
    if @color == "white"
      PAWN_ATTACK
    else
      convert_color(PAWN_ATTACK)
    end
  end

  def convert_color(diff)
    diff.map {|el| el.map {|num| num * -1}}
  end

end
