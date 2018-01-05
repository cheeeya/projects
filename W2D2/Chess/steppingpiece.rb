module SteppingPiece

  def moves
    poss_moves = []
    x, y = @current_position
    move_diffs.each do |dxdy|
      dx, dy = dxdy
      new_x, new_y = (x + dx), (y + dy)
      if new_x.between?(0, 7) && new_y.between?(0, 7)
        new_pos = [new_x, new_y]
        if @board[new_pos].class != NullPiece
          if @board[new_pos].color != self.color
            possible_moves << new_pos
          end
          poss_moves << new_pos
        end
      end
    end
    poss_moves
  end

  private

  def move_diffs
  end
end
