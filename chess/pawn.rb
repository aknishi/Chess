require_relative 'board'
require_relative 'piece'

class Pawn < Piece


  def initialize(color, board, pos)
    if color == :white
      @type = "♙"
    else
      @type = "♟"
    end
    super(color, board, pos, type)
  end


end
