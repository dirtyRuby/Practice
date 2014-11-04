class A
  def m1
    puts 10
  end
end

class A
  def m2
    puts 20
    m3
  end
  alias_method :m3, :m1
  alias_method :m1, :m2
end

a = A.new
a.m1
