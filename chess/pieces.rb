class Piece

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

  def symbol
  end

  protected
  def move_dirs
  end

end

class Bishop < Piece

  def symbol
  end

  protected
  def move_dirs
  end

end

class Queen < Piece
  def symbol
  end

  protected
  def move_dirs
  end

end

class Knight < Piece
  def symbol
  end

  protected
  def move_diffs
  end

end

class King < Piece
  def symbol
  end

  protected
  def move_diffs
  end
end
