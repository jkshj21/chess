require_relative "piece"
require "byebug"

class Board
  attr_accessor :grid, :cursor
  attr_reader :display

  def initialize
    @grid = Array.new(8){Array.new(8)}
    fill_front_back_rows(grid)
    # @cursor = Cursor.new([0,0],self)
    @display = Display.new(self)

    play_turn
  end


  def fill_front_back_rows(grid)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    k=0
    (0...8).each do |i|
      (0...8).each do |j|
        if i == 1 || i == 6
          @grid[i][j] = Pawn.new("Pawn", [i,j], self)
        elsif i == 0 || i == 7
          # @grid[i][j] = Piece.new(pieces[j], [i,j])
          @grid[i][j] = pieces[j].new(pieces[j].to_s.split("").take(4).join(""), [i,j], self)
        else
          @grid[i][j] = NullPiece.new
        end
      end
    end
    nil
  end

  def play_turn
    puts "\n"
    number_of_clicks = 0
    start = display.cursor.cursor_pos
    while true
      display.render
      c = display.cursor.get_input # returns current cursor after user hits the return button
      if c != nil
        if number_of_clicks == 0
          puts "Choose Piece"
          start = display.cursor.cursor_pos
          if self[start].class.superclass == Piece
            number_of_clicks+=1
          else
            play_turn
          end
        else
          end_ = display.cursor.cursor_pos
          move_piece(start, end_)
          number_of_clicks = 0


        end
      end
    end
  end

  def in_bounds(cursor_pos)
    x, y = cursor_pos
    return (x >= 0 && x < 8 && y >= 0 && y < 8)
  end

  def move_piece(start_pos, end_pos)
    raise "dummy that wasn't a piece" if self[start_pos].class == NullPiece
    raise "can't move on top of that guy" if self[end_pos].class == Piece
    temp = self[start_pos]
    self[start_pos] = self[end_pos] # self.grid[x][y]
    self[end_pos] = temp
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    row, col = pos
    self.grid[row][col] = piece
  end

  # def inspect
  #   self.grid.each_with_index do |row, idx|
  #     last = self.grid.length - 1
  #     string = ""
  #     row.each do |pos|
  #       # str+= #{pos.piece
  #     string += "#{pos.piece} |"
  #
  #     end
  #     puts string
  #     puts "------------------------------------------------" unless last == idx
  #   end
  #   return ""
  # end

end
