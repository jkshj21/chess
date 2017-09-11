require_relative "cursor"

class Display

  def initialize

    @cursor = Cursor.new([0,0], grid)
  end

end
