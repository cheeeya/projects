
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
          print "#{@board[pos].symbol.yellow} "
        elsif @board[pos] != nil
          print "#{@board[pos].symbol} "
        else
          print "* "
        end
      end
      puts
    end

    puts
    puts "---------------"
    puts

    # puts "  #{(0..7).to_a.join(" ")}"
    # @board.board.each_with_index do |row, i|
    #
    #   puts "#{i} #{row.join(" ")}"
    # end

  end



end

  b = Board.new
  d = Display.new(b)
  while true
    d.render
    d.cursor.get_input
  end
