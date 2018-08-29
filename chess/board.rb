require_relative 'pieces'
require 'byebug'

class Board

  attr_accessor :rows

  def initialize
    @rows = Array.new(8){Array.new(8)}
    @sentinel = NullPiece.new
    @rows[0][0] = Rook.new("black", self, [0,0])
    @rows[0][7] = Rook.new("black", self, [0,7])
    @rows[7][0] = Rook.new("white", self, [7,0])
    @rows[7][7] = Rook.new("white", self, [7,7])
    @rows[0][1] = Knight.new("black", self, [0,1])
    @rows[0][6] = Knight.new("black", self, [0,6])
    @rows[7][1] = Knight.new("white", self, [7,1])
    @rows[7][6] = Knight.new("white", self, [7,6])
    @rows[0][2] = Bishop.new("black", self, [0,2])
    @rows[0][5] = Bishop.new("black", self, [0,5])
    @rows[7][2] = Bishop.new("white", self, [7,2])
    @rows[7][5] = Bishop.new("white", self, [7,5])
    @rows[0][3] = King.new("black", self, [0,3])
    @rows[7][4] = King.new("white", self, [7,4])
    @rows[0][4] = Queen.new("black", self, [0,4])
    @rows[7][3] = Queen.new("white", self, [7,3])

    (0..7).each do |col|
      @rows[1][col] = Pawn.new("black", self, [1, col])
      @rows[6][col] = Pawn.new("white", self, [6, col])
    end

    (0..7).each do |col|
      (2..5).each do |row|
        @rows[row][col] = NullPiece.new
      end
    end

  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    # debugger
    x, y = pos
    @rows[x][y] = val
    # self[pos] = val THIS WILL CALL ITSELF INFINITELY
  end

  def move_piece(color, start_pos, end_pos)
    raise "#{self[end_pos]} is at #{end_pos}" unless self[end_pos].is_a?(NullPiece)
    raise "No piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
    raise "Not your piece" if self[start_pos].color != color
    # debugger
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def valid_pos?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

end
