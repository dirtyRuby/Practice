class A
  def m1(*v)
    v.each{ |vl|
      puts vl.class
    }
  end
end

#Для запуска в irb
a = A.new
a.m1 :sfdsr, :dasda, d: 10, e: 10