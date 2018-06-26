require_relative 'board'
class Piece

  attr_reader :type, :position, :color

  def initialize(color, board, pos, type)
    @color = color
    @board = board
    @position = pos
    @type = type
    @moves = []
  end

  def symbol
    type
  end

  def valid_move?(pos)
    true
  end

end


module SlidingPiece
  HORIZONTAL_DIRS = [[0, -1],[0, 1],[-1, 0],[1, 0]]
  DIAGONAL_DIRS = [[1,1],[1,-1],[-1,1],[-1,-1]]

  def horizontal_dirs(start_pos)
    result = []
    HORIZONTAL_DIRS.each do |direction|
      @found_opposite = false
      new_pos = start_pos[0] + direction[0], start_pos[1] + direction[1]
      while valid_move?(new_pos)
        result << new_pos
        new_pos = new_pos[0] + direction[0], new_pos[1] + direction[1]
      end
      result << new_pos if @found_opposite == true
    end
    result
  end

  def diagonal_dirs(start_pos)
    result = []
    DIAGONAL_DIRS.each do |direction|
      @found_opposite = false
      new_pos = start_pos[0] + direction[0], start_pos[1] + direction[1]
      while valid_move?(new_pos)
        result << new_pos
        new_pos = new_pos[0] + direction[0], new_pos[1] + direction[1]
      end
      result << new_pos if @found_opposite == true
    end
    result
  end

  def valid_move?(pos)
    #check if there is a piece, if it's same color, if it's out of bounds,
    return false if pos.any? {|i| i > 7 || i < 0 }
    if @board[pos].is_a?(Piece)
      if @board[pos].color == self.color
        return false
      else
        @found_opposite = true
        return false
      end
    end
    true
  end

  def get_moves(dir)
    @moves = grow_unblocked_moves_in_dir(dir)
  end

  private

  def grow_unblocked_moves_in_dir(dir)
    if dir == :horizontal
      horizontal_dirs(position)
    else
      diagonal_dirs(position)
    end
  end
end

module  SteppingPiece
  def moves

  end

  private

  def moves_diffs

  end

end
