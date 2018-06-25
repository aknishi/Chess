
class Piece
  def initialize(loc)
    @location = loc
  end
  
  def inspect
    p "piece"
  end
  def valid_move?(pos)
    true    
  end
end