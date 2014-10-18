# Подсчет суммы всех чисел кратных 3 и 5 в диапазоне [1,a)
class C
  def initialize(a)
    @a=a
  end
  def method proc
    i = 0
    arr = []
    while @a != i
        arr.push(@a)
        @a -=1
    end
    arr.reverse!
    if proc.lambda?
      return proc.call(arr)
    end
  end
end

l1 = ->(arg) {
  sum = 0
  if arg.class == Array
    arg.each do |elem|
      if ((elem%3==0 || elem%5 ==0) && elem != arg.last)
        sum = sum+elem
      end
    end
  return sum
  end
}

a = C.new(10)
a.method l1

l2 = -> {
  puts "Works!"
}

l3 = lambda{ |arg|
  puts "Works with #{arg}"
}

l4 = lambda{ |arg1,arg2,arg3|
  puts "Works with #{arg1} #{arg2} #{arg3}"
}
#Строгая обработка параметров

l5 = -> (item,index) {item%2 == 0 && index%2>0}

[1,2,3,4,5,6].each_with_index.map &l5 # => [false, true, false, true, false, true]

