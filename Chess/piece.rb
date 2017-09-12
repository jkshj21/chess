require_relative "board"

module SlidingPiece

  def horizontal(current_pos)
    possibles = []
    x, y = current_pos
    until x == 0 || board[pos].class != NullPiece
      possibles << [x, y]
      x -= 1
    end
    until x == 0 || board[pos].class != NullPiece
      possibles << [x, y]
      x += 1
    end
    possibles
  end
  def vertical
    possibles = []
    x, y = current_pos
    until y == 0 || board[pos].class != NullPiece
      possibles << [x, y]
      y -= 1
    end
    until y == 0 || board[pos].class != NullPiece
      possibles << [x, y]
      y += 1
    end
    possibles
  end
end

module SteppingPiece

end

class Piece
  attr_reader :piece, :curr_pos, :board
  def initialize(name, curr_pos, board)
    @piece = name
    @curr_pos = curr_pos
    @board = board
  end

  def valid_moves

  end

end


class NullPiece < Piece
  include SlidingPiece
  def initialize
    # @piece = space
  end

end

class Bishop < Piece
  include SlidingPiece
  def initialize(name, curr_pos, board)
    super(name, curr_pos, board)
  end

  def move_dirs

  end
end

class Rook < Piece
  include SlidingPiece
  def initialize(name, curr_pos, board)
    super(name, curr_pos, board)
  end

  def move_dirs

  end
end

class Queen < Piece
  include SlidingPiece
  def initialize(name, curr_pos, board)
    super(name, curr_pos, board)
  end

  def move_dirs

  end
end

class King < Piece
  include SlidingPiece
  def initialize(name, curr_pos, board)
    super(name, curr_pos, board)
  end

  def mov_dirs

  end
end

class Knight < Piece
  include SteppingPiece
  def initialize(name, curr_pos, board)
    super(name, curr_pos, board)
  end

  def mov_dirs

  end
end

class Pawn < Piece
  include SteppingPiece
  def initialize(name, curr_pos, board)
    super(name, curr_pos, board)
  end

  def mov_dirs

  end
end
