require_relative 'piece'
require_relative 'null_piece'

class Board
  
  attr_accessor :grid
  
  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
    
  end
  
  def reset_board
    reset_lines = [0,1,6,7]
    grid.each_with_index do |line, row|
      line.each_index do |col|
        if reset_lines.include?(row)
          grid[row][col] = Piece.new([row, col])
        else
          grid[row][col] = NullPiece.new([row, col])
        end
      end
    end
  end
  
  def move_piece(start_pos, end_pos)
    raise "No piece to move" if self[start_pos].is_a?(NullPiece)
    raise "The piece #{} cannot move there" unless self[start_pos].valid_move?(end_pos)
    raise "Position occupied by your own piece" unless valid_pos?(end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
  
  def valid_pos?(pos)
    #Check if piece is on your team
    return false if self[pos].is_a?(Piece) 
    true   
  end
  
  def []=(pos, piece)
    row,col = pos
    @grid[row][col] = piece
  end
  
  def [](pos)
    row,col = pos
    @grid[row][col]
  end
  
end