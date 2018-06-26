require_relative 'board'
require_relative 'piece'

class Knight < Piece
  include SteppingPiece
end
