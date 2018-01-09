

module SlidingPiece
  HORIZONTAL_DIRS = [
    [0, -1],
    [0, 1],
    [1, 0],
    [-1, 0]
  ].freeze

  DIAGONAL_DIRS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ].freeze

  def moves
    poss_moves = []
    self.move_dirs.each do |dxdy|
      dx, dy = dxdy
      poss_moves += grow_unblocked_moves_in_dir(dx,dy)
    end
    poss_moves
  end

  private

  def move_dirs
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def grow_unblocked_moves_in_dir(dx,dy)

    x, y = @current_position
    new_x, new_y = (x + dx), (y + dy)
    possible_moves = []
    while(new_x.between?(0,7) && new_y.between?(0,7))
      new_pos = [new_x, new_y]
      if @board[new_pos].class != NullPiece
        if @board[new_pos].color != self.color
          possible_moves << new_pos
        end
        break
      end
      possible_moves << new_pos
      new_x += dx
      new_y += dy
    end
    possible_moves
  end
end
