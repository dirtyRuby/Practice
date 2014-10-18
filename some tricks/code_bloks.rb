#Передача блока кода в виде переменной в метод

class Clock


  def method description, &proc
    temp = Time.now.hour
    if temp>12
      temp = temp%12
    end
    else if temp == 0
      temp = 12
    end

    puts "#{description} #{temp}"
    temp.times do
      proc.call
    end
  end
end

  #для запуска в irb
Clock.new.method'Сейчас' do puts "Ping" end

#Передача блока кода с параметрами

class A
  @@res = nil
  def initialize(a)
    @a = a
    @@res = a
  end
  def set_val (a)
    @a = a
  end
  def get_val
    @a
  end
  def reset
    @a = @@res
  end
  def m1 (&proc)
    set_val(proc.call @a)
    puts "Now a = #{@a}"
  end
end

  #для запуска в irb
a = A.new(2)
a.m1 do |param|
  param +=param;
end

# Присвоение блока кода переменной, возврат процедурного
#объекта методом.

class B

  attr_accessor :a
  attr_accessor :b
  attr_accessor :c

  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end

  def m1 proc1,proc2
    @a = proc2.call(proc1.call @a)
  end

  def m2 proc1,proc2
    Proc.new do |p|
      proc2.call(proc1.call p)
    end
  end
end


  #для запуска в irb
proc1 = Proc.new { |p|
    p + 1
}

proc2 = Proc.new do |p|
    p ** 2
end

b = B.new(1,1,1)
new_proc = b.m2 proc2,proc1
val1 = b.m1 proc1,proc2
val2 = new_proc.call(b.a)
val1  != val2  ?  (puts "Works!"): (puts "Doesn't work!")