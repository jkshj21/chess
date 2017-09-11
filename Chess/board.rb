require_relative "piece"
class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8){Array.new(8)}
  end

  def move_piece(start_pos, end_pos)

  end

end
