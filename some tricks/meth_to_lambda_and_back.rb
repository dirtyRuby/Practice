  def m proc
      20+proc[1]
  end

l1 = method(:m)

puts m(1)
puts m l1