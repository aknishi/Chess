
class Piece
  
  attr_reader :value
  
  def initialize(loc)
    @location = loc
    @value = "P"
  end
  
  def inspect
    print "P"
  end
  
  def valid_move?(pos)
    true    
  end
  
  def to_s
    print "p"
  end
end