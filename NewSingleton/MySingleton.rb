#Вариант 1
class MySingleton
  attr_reader :instance
  @@instance = self.new

  public
  def self.instance
    @@instance
  end
  private
  def self.new
  end
end

# Для запуска в irb
a = MySingleton.new
a = MySingleton.instance

#Вариант 2?
class MySingleton

  @@instance = self.new

  def self.new
    @@instance
  end
end






