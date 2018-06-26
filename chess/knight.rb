require_relative 'board'
require_relative 'piece'

class Knight < Piece
  include SteppingPiece

  def initialize(color, board, pos)
    if color == :white
      @type = "♘"
    else
      @type = "♞"
    end

    super(color, board, pos, type)
  end

  def update_moves
    p @moves = get_moves(:knight)
  end

end
