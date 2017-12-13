require 'colorize'
require_relative 'board'
require_relative 'cursor'
class Display
  attr_accessor :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    (0..7).each do |idx1|
      (0..7).each do |idx2|
        pos = [idx1, idx2]
        if pos == @cursor.cursor_pos
          print "X ".yellow
        elsif @board[pos] != nil
          print "X "
        else
          print "* "
        end
      end
      puts
    end


    # puts "  #{(0..7).to_a.join(" ")}"
    # @board.board.each_with_index do |row, i|
    #
    #   puts "#{i} #{row.join(" ")}"
    # end

  end



end

  def test
    b = Board.new
    d = Display.new(b)
    while true
      d.render
      d.cursor.get_input
    end

    end
