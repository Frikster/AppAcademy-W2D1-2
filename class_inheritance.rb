require "byebug"
class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplyer)
    @salary * multiplyer
  end
end

class Manager < Employee
  attr_reader :employee_array

  def initialize(name, title, salary, boss, employee_array)
    super(name, title, salary, boss)
    @employee_array = employee_array
  end

  def bonus(multiplyer)
    sub_salaries(self) * multiplyer
  end

  def sub_salaries(employee)
    return employee.salary if !employee.is_a?(Manager)
    # return manager.salary if manager.employee_array.length == 0
    res = []
    debugger
    @employee_array.each do |emp|
      debugger
      res << sub_salaries(emp) if emp.is_a?(Manager)
      res << emp.salary if !emp.is_a?(Manager)
    end
    debugger
    res.sum + employee.salary
  end

end
