
class NullPiece

  attr_reader :value

  def initialize(pos)
    @position = pos
    @value = " "
  end

  def inspect
    print " "
  end

  def to_s
    print " "
  end
end
