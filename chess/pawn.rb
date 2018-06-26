require_relative 'board'
require_relative 'piece'

class Pawn < Piece
  WHITE_DIR = [[1, 0],[1,-1],[1,1]]
  BLACK_DIR = [[-1,0],[-1,-1],[-1,1]]

  def initialize(color, board, pos)
    @color = color
    if color == :white
      @type = "♙"
    else
      @type = "♟"
    end
    super(color, board, pos, type)
  end

  def update_moves
    if @color == :white
      p @moves = get_moves(:white)
    else
      p @moves = get_moves(:black)
    end
  end

  def get_moves(color)
    result = []
    if color == :white
      color_arr = WHITE_DIR
      if position[0] == 1
        new_pos = position[0] + 2, position[1]
        result << new_pos if @board[new_pos].is_a?(NullPiece)
      end
      new_pos = position[0] + 1, position[1]
      result << new_pos if @board[new_pos].is_a?(NullPiece)
    else
      color_arr = BLACK_DIR
      if position[0] == 6
        new_pos = position[0] - 2, position[1]
        result << new_pos if @board[new_pos].is_a?(NullPiece)
      end
      new_pos = position[0] -1, position[1]
      result << new_pos if @board[new_pos].is_a?(NullPiece)
    end

    result + check_diagonals(color)
  end


  WHITE_DIR = [[1, 0],[1,-1],[1,1]]
  BLACK_DIR = [[-1,0],[-1,-1],[-1,1]]

  def check_diagonals(color)
    result = []
    if color == :white
      new_pos = position[0] + 1, position[1] - 1
      result << new_pos if @board[new_pos].is_a?(Piece) && @board[new_pos].color == :black
      new_pos = position[0] + 1, position[1] + 1
      result << new_pos if @board[new_pos].is_a?(Piece) && @board[new_pos].color == :black
    else
      new_pos = position[0] - 1, position[1] - 1
      result << new_pos if @board[new_pos].is_a?(Piece) && @board[new_pos].color == :white
      new_pos = position[0] - 1, position[1] + 1
      result << new_pos if @board[new_pos].is_a?(Piece) && @board[new_pos].color == :white
    end
    result
  end
end
