# https://projecteuler.net/problem=19

class Day
  attr_accessor :day, :month, :year, :dotw
  def initialize (day, month, year, dotw)
    @day = day
    @month = month
    @year = year
    @dotw = dotw
  end
  
  def leap?
    if self.year % 400 == 0
      true
    elsif self.year % 100 == 0
      false
    elsif self.year % 4 == 0
      true
    else
      false
    end
  end
  
  def change_dotw
    if self.dotw < 6
      self.dotw += 1
    elsif dotw == 6
      self.dotw = 0
    end
  end
  
  def change_day
    if self.day < self.check_days_in_month
      self.day += 1
      self.change_dotw
    elsif self.day == self.check_days_in_month
      self.day = 1
      self.change_month
      self.change_dotw
    end
  end

  def change_month
    self.change_year if self.month == 12
    self.month = (self.month % 12) + 1
  end
  
  def change_year
    self.year += 1
  end
  
  def check_days_in_month
    m = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if self.month == 2 && self.leap?
      return 29
    else
       return m[self.month]
    end
  end
end

current = Day.new(01, 01, 1901, 1)
days_in_year = 365
count = 0

while current.year <= 2000
  if current.dotw == 6 && current.day == 1
    count += 1
  end
  current.change_day
end

p count