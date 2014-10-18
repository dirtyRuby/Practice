a = Enumerator.new([1, 2, 3, 4, 5, 6], :each_index)

a.next # => 0 индекс первого елемента

a = Enumerator.new([1, 2, 3, 4, 5, 6], :each_with_index)

a.next #=> [1, 0] значение, индекс
a.peek #=> [2, 1] значение, индекс. Итерация остается прежней.
a.rewind #Возвращается к началу последовательности.

a = Enumerator.new([1, 2, 3, 4, 5, 6], :each_with_object) # ???
a = Enumerator.new([1, 2, 3, 4, 5, 6], :each_object) # ???

a = [1,2,3].to_enum
a.inspect #=> "[1,2,3]"