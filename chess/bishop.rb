require_relative 'board'
require_relative 'piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(color, board, pos)
    if color == :white
      @type = "♗"
    else
      @type = "♝"
    end

    super(color, board, pos, type)

  end

  def update_moves
    p @moves = get_moves(:diagonal)
  end

end
