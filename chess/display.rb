require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  attr_reader :board, :cursor
  def initialize(board, cursor)
    @board = board
    @cursor = cursor
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
