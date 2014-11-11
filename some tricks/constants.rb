module A
  class B
    A1,A2,A3,A4,A5,A6,A7,A8,A9,A10 = 2,4,6,8,10,12,14,16,18,20
    MY_CONST = 30
  end
end

puts Object.const_get 'A::B::MY_CONST'

for i in 1..10 do
  A.const_set "A#{i}", i*2
  puts A.const_get "A#{i}"
end
