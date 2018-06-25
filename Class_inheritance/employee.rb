class Employee
  
  def initialize(name, title, salary)
    @name = name
    @title =title
    @salary = salary
  end
  
  def bonus(multiplier)
    bonus = salary * multiplier
  end
  
  def set_boss(boss)
    @boss = boss
  end
  
  protected 
  
  attr_accessor :boss
  attr_reader :name, :title, :salary
  
end