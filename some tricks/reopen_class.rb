class A
  def method
    10
  end
end

class A
  alias_method :method1, :method
  def method
    20
  end
end

#Для запуска в irb
a = A.new
a.method
a.method1