require_relative "cursor"
require "colorize"


class Display

  attr_reader :board_colors, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    render
  end


  def render
    curr_pos = @cursor.cursor_pos
    system("clear")
    @board.grid.each_with_index do |row, idx|
      last = @board.grid.length - 1
      string = ""
      row.each_with_index do |piece,j|
        if piece.class == NullPiece
          element = "    "
        else
          element = piece.piece
        end

        # str+= #{pos.piece
        if [idx,j] == curr_pos
          string += "#{element}  ".colorize(:background=>:blue, :color => :white)
        elsif (j + idx) % 2 == 0
          string += "#{element}  ".colorize(:background=>:red, :color => :white)
        else
          string += "#{element}  ".colorize(:background=>:yellow, :color => :black)
        end

      end
      puts string
      # puts "------------------------------------------------" unless last == idx
    end
    return ""
  end



end
