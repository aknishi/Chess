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
    @moves.any? {|valid_pos| valid_pos == pos}
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
  KING_DIRS = [[0,-1],[0,1],[-1,0],[1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
  KNIGHT_MOVEMENT = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,-2],[-1,2]]

  def get_moves(piece)
    if piece == :knight
      @moves = generate_knight_moves(position)
    else
      @moves = generate_king_moves(position)
    end
  end


  private

  def generate_knight_moves(position)
    result = []
    KNIGHT_MOVEMENT.each do |dir|
      new_pos = dir[0] + position[0], dir[1] + position[1]
      result << new_pos if valid_move?(new_pos)
    end
    result
  end

  def generate_king_moves(position)
    result = []
    KING_DIRS.each do |dir|
      new_pos = dir[0] + position[0], dir[1] + position[1]
      result << new_pos if valid_move?(new_pos)
    end
    result
  end

  def valid_move?(pos)
    return false if pos.any? {|i| i > 7 || i < 0 }
    if @board[pos].is_a?(Piece)
      if @board[pos].color == self.color
        return false
      else
        return true
      end
    end
    true
  end

end
