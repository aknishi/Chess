require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  attr_reader :board, :cursor
  def initialize(board, cursor)
    @board = board
    @cursor = cursor
  end

  def play
    loop do
      # system("clear")
      render
      cursor.get_input
    end
  end

  def render
    puts "---------------------------------"
    board.grid.each_with_index do |line, row|
      print "|"
      line.each_index do |col|
        if [row,col] == @cursor.cursor_pos
          print " #{board.grid[row][col].type.colorize(:color => :white)} ".colorize(:background => :blue) + "|"
        else
          print " #{board.grid[row][col].type.colorize(:color => :white)} |"
        end

      end
      print "\n"
      print "---------------------------------\n"
    end
  end
  #ctrl-cmd-space emojis 👌🏾
end


if $PROGRAM_NAME == __FILE__
  board = Board.new
  cursor = Cursor.new([0,0], board)
  board.reset_board
  display = Display.new(board, cursor)

  display.render
  display.play
end
