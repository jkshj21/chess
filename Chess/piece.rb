
class Piece
  attr_reader :piece
  def initialize(bool)
    @piece = bool
  end
end

class NullPiece < Piece

  def initialize
    @piece = nil
  end


end
