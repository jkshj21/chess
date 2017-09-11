require "byebug"

class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, employees=[])
    super(name, title, salary, boss)
    @employees = employees
  end


  def bonus(multiplier)
    self.salary_of_subs * multiplier
  end

  def show_all_employees
    self.employees.each {|emp| puts emp.name}
  end

protected

  def salary_of_subs
    total = 0
    debugger
    self.employees.each do |emp|
      if emp.class == Manager
        # debugger
        total += emp.salary
        debugger
        x = emp.salary_of_subs
        debugger
        total += x
      else
        # debugger
        total += emp.salary
      end
    end
    total
  end
end
