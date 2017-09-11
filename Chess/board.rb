require_relative "piece"
require "byebug"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8){Array.new(8)}

    (0...8).each do |i|
      (0...8).each do |j|
        if i == 0 || i == 1 || i == 6 || i == 7
          @grid[i][j] = Piece.new(true)
        else
          @grid[i][j] = NullPiece.new()
        end
      end
    end

  end

  def move_piece(start_pos, end_pos)

    raise "error" if self[start_pos].class == NullPiece
    raise "error case 2" if self[end_pos].class == Piece



  end

  def [](pos)

    x, y = pos

    @grid[x][y]

  end

  def []=(pos, piece)
    row, col = pos
    self.grid[row][col] = piece
  end

end


#
# def []=(pos, value)
#     row, col = pos
#     tile = grid[row][col]
#     tile.value = value
#   end

# def [](pos)
#     row, col = pos
#     grid[row][col]
#   end
