require_relative 'board'
require_relative 'piece'

class Rook < Piece
include SlidingPiece

def initialize(color, board, pos)
  if color == :white
    @type = "♖"
  else
    @type = "♜"
  end

  super(color, board, pos, type)
end

def update_moves
  @moves = get_moves(:horizontal)
end

end
