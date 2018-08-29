require 'colorize'
require_relative 'cursor'
require_relative 'board'
require 'byebug'

class Display


  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.rows.each_with_index do |row, idx|
      row.each_with_index do |piece, jdx|
        # debugger
        sym = " " + piece.class.to_s[0] + " "
        sym = " * " if piece.is_a?(King)
        sym = " _ " if piece.is_a?(NullPiece)
        if @cursor.cursor_pos == [jdx, idx]
          print(sym.colorize(:red))
        else
          print(sym)
        end
      end
      print("\n")
    end
    @cursor.get_input
    # debugger
    # if res == @cursor_pos
    #   selected = @cursor_pos
    #
    #   prev_pos = @cursor_pos
    # end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  # cursor = Cursor.new([0,0], board)
  display = Display.new(board)
  loop do
    display.render
  end
end
