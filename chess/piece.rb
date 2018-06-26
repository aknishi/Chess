require_relative 'board'
class Piece

  attr_reader :type

  def initialize(pos)
    @position = pos
    @type = "♘"
    @moves = []
  end

  def valid_move?(pos)
    true
  end

end


module SlidingPiece

end

module  SteppingPiece


end
