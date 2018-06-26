
class NullPiece
  
  attr_reader :value

  def initialize(loc)
    @location = loc
    @value = " "
  end
  
  def inspect
    print " "
  end
  
  def to_s
    print " "    
  end
end