class MyOpenStruct
  attr_reader :table # :nodoc:
  protected :table

  def initialize(hash=nil)
    @table = {}
    if hash
      for k,v in hash
        @table[k.to_sym] = v
        new_ostruct_member(k)
      end
    end
  end

  def new_ostruct_member(name)
    name = name.to_sym
    unless self.respond_to?(name)
      class << self; self; end.class_eval do
        define_method(name) { @table[name] }
        define_method("#{name}=") { |x| @table[name] = x }
      end
    end
    name
  end

  def method_missing(mid, *args) # :nodoc:
    mname = mid.id2name
    len = args.length
    if mname.chomp!('=')
      if len != 1
        raise ArgumentError, "wrong number of arguments (#{len} for 1)", caller(1)
      end
      @table[new_ostruct_member(mname)] = args[0]
    elsif len == 0
      @table[mid]
    else
      raise NoMethodError, "undefined method `#{mname}' for #{self}", caller(1)
    end
  end
end

a = MyOpenStruct.new
a.name = :field1
puts a.name

