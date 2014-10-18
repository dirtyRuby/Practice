#Вариант1
class MyStruct
  def initialize(name,*fields)
    c = Class.new do
      fields.each do |field|

        define_method field.intern do
          instance_variable_get("@#{field}")
        end

        define_method "#{field}=".intern do |arg|
          instance_variable_set("@#{field}", arg)
        end

        define_method :initialize do |*values|
            fields.each_with_index do |name,i|
              instance_variable_set("@#{name}", values[i])
            end
        end
      end
    end
    Object.const_set name, c
  end
end

#Вариант2
class MyStruct
  def self.new *args
    c = Class.new

    args.each do |meth_name|
      c.class_eval %Q{
        def #{meth_name}(param = nil)
          if param
            @#{meth_name} = param
          else
            @#{meth_name}
          end
        end
      }
    end

    c.class_eval %Q{
      def initialize(*arg)
        #{args}.each_with_index do |attr, i|
          instance_variable_set("@" + attr.to_s, arg[i])
        end
      end
    }
    c
  end
end
