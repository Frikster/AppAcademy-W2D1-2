require_relative 'board'

module Slideable
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    res = []
    move_dirs.each do |(dx, dy)|
      res += grow_unblocked_moves_in_dir(dx, dy)
      # debugger
    end
    res
  end

  private
  HORIZONTAL_DIRS = [[-1, 0],[1, 0],[0, -1],[0, 1]]
  DIAGONAL_DIRS = [[-1, -1],[1, 1],[1, -1],[-1, 1]]

  def move_dirs
    self.move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    res = []
    board = self.board
    pos = self.pos.dup
    loop do
      # debugger
      pos = pos.map.with_index{ |el, idx| el + [dx, dy][idx] }
      # debugger
      if board.valid_pos?(pos) && board[pos].is_a?(NullPiece)
        res << pos
      else
        break
      end
      # debugger
    end
    # debugger
    res
  end
end

module Stepable
  def moves
    res = []
    board = self.board
    move_diffs.each do |diff|
      # debugger
      pos = self.pos.dup
      pos = pos.map.with_index{ |el, idx| el + diff[idx] }
      if board.valid_pos?(pos) && board[pos].is_a?(NullPiece)
        res << pos
        # debugger
      end
    end
    # debugger
    res
  end

  private
  def move_diffs
    self.move_diffs
  end
end

class Piece
  attr_reader :color, :pos, :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
  end

  private
  def move_into_check?(end_pos)
  end

end

class NullPiece < Piece
  def initialize
  end

  def moves
  end

  def symbol
  end

end

class Pawn < Piece

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
  end

  def move_dirs
  end

  private
  def at_start_row?
  end

  def forward_dir
  end

  def forward_steps
  end

  def side_attacks
  end

end


class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
  end

  protected
  def move_dirs
    horizontal_dirs
  end

end

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
  end

  protected
  def move_dirs
    diagonal_dirs
  end

end

class Queen < Piece
  include Slideable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    'Q'
  end

  protected
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
  end

  protected
  def move_diffs
    [[2,-1],[2,1],[1,2],[1,-2],[-2,-1],[-2,1],[-1,-2],[-1,2]]
  end

end

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
  end

  protected
  def move_diffs
    [[-1, 0],[1, 0],[0, -1],[0, 1]] + [[-1, -1],[1, 1],[1, -1],[-1, 1]]
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  queen = board[[7,3]]
  knight = board[[7,1]]
  knight2 = Knight.new("black", board, [4, 5])
  bishop = Bishop.new("white", board, [4, 4])
  rook = Rook.new("white", board, [5, 0])
  p queen.moves
  # debugger
  p "knight"
  p knight.moves
  p "knight2"
  p knight2.moves
  p "bishop"
  p bishop.moves
  p "rook"
  p rook.moves
end
