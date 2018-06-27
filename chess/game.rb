require_relative 'board'
require_relative 'display'
require_relative 'cursor'
require_relative 'null_piece'

class Game

  attr_accessor :board, :cursor, :display

  def initialize()
    @board = Board.new
    board.reset_board
    @cursor = Cursor.new([0,0], @board)
    @display = Display.new(@board, @cursor)
    @start_pos = nil
  end

  def play
    loop do
      system("clear")
      display.render
      # puts "Select piece to move"
      cursor.get_input
      # puts "Select position to move to"
      # if @start_pos
      # end_pos =
      # board.move_piece(start_pos, end_pos)
    end
  end

end


if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.play
end
