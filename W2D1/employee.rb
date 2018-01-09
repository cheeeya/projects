class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    bonus = []
    @employees.each do |el|
      if el.is_a?(Manager)
        bonus << el.bonus(1)
      end
        bonus << el.salary
    end
    bonus.reduce(:+) * multiplier
  end
end

d = Employee.new("david", "ta", 10000, "darren")
s = Employee.new("shawna", "ta", 12000, "darren")
d2 = Manager.new("darren", "ta manager", 78000, "ned", [d,s])
n = Manager.new("ned", "ceo", 1000000, nil, [d2])
