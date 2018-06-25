require_relative "employee"


class Manager < Employee
  def initialize(name, title, salary)
    @employees = []
    super(name, title, salary)
  end
  
  def bonus(multiplier)
    salary_sum = 0
    employees.each do |employee|
      if employee.is_a?(Manager) 
        salary_sum += employee.bonus(multiplier)
      else
        salary_sum += employee.salary
      end
    end
    
    salary_sum * multiplier
  end
  
  def add_employee(employee)
    employees << employee
  end
  
  
  protected
  
  attr_accessor :employees
end


if $PROGRAM_NAME = __FILE__
  david = Employee.new("david", "TA", 10000)
  shawna = Employee.new("shawna", "TA", 12000)
  darren = Manager.new("darren", "TA Manager", 78000)
  ned = Manager.new("ned", "Founder", 1000000)
  
  david.set_boss(darren)
  shawna.set_boss(darren)
  darren.set_boss(ned)
  
  darren.add_employee(david)
  darren.add_employee(shawna)
  ned.add_employee(darren)
  
  puts ned.bonus(5) # => 500_000
  puts darren.bonus(4) # => 88_000
  puts david.bonus(3) # => 30_000
  
end