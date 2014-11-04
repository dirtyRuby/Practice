module A
  class B
    MY_CONST = 30
  end
end

puts Object.const_get 'A::B::MY_CONST'