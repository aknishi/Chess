require_relative 'piece'
require_relative 'null_piece'
require_relative 'pawn'
require_relative 'rook'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'knight'

class Board

  attr_accessor :grid

  def initialize(grid = Array.new(8) {Array.new(8)})
    @grid = grid
  end

  def in_check?(king_pos, team)
    other_team = generate_opposite_team(team)

    other_team.each do |piece|
      piece.update_moves
      piece.moves.each do |pos|
        return true if pos == king_pos
      end
    end
    false
  end

  def checkmate?(king, color)
    king.update_moves
    king.moves.all? do |pos|
      in_check?(pos, color)
    end
    false
  end

  def generate_opposite_team(team)
    pieces = []
    grid.each do |row|
      row.each do |el|
        if el.is_a?(Piece)
          pieces << el unless el.color == team
        end
      end
    end
    pieces
  end

  def reset_board
    grid.each_with_index do |line, row|
      line.each_index do |col|
        if row == 0
          generate_piece_order(row, :white)
        elsif row == 7
          generate_piece_order(row, :black)
        elsif row == 1
          grid[row][col] = Pawn.new(:white, self, [row,col])
        elsif row == 6
          grid[row][col] = Pawn.new(:black, self, [row,col])
        else
          grid[row][col] = NullPiece.new([row, col])
        end
      end
    end
  end

  def generate_piece_order(row, color)
    (0..7).to_a.each do |col|
      if col == 0 || col == 7
        grid[row][col] = Rook.new(color, self, [row, col])
      elsif col == 1 || col == 6
        grid[row][col] = Knight.new(color, self, [row, col])
      elsif col == 2 || col == 5
        grid[row][col] = Bishop.new(color, self, [row, col])
      elsif col == 3
        grid[row][col] = Queen.new(color, self, [row, col])
      else
        grid[row][col] = King.new(color, self, [row, col])
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No piece to move" if self[start_pos].is_a?(NullPiece)
    raise "The piece #{} cannot move there" unless self[start_pos].valid_move?(end_pos)
    raise "Position occupied by your own piece" unless valid_pos?(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def valid_pos?(start_pos, pos)
    return false if self[start_pos].color == self[pos].color
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
