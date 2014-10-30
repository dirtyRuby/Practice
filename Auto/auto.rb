module Comfort
  def comfort
    true
  end
end

class Auto
  include Comfort

  def speed
    100
  end
  def comfort
    true
  end

end
class Audi < Auto
  def speed
    super+100
  end
end
class Mercedes < Auto
  def speed
    super+102
  end
end
class Toyota < Auto

end
class Jiguli < Auto
  def speed
    super-90
  end
  def comfort
    false
  end
end

class Building
  include Comfort
end

class Office < Building

end

class Home < Building

end

iteration = [Audi.new,Mercedes.new,Toyota.new,Jiguli.new,Office.new,Home.new].each
for i in 1..iteration.size
  k = iteration.next
  if k.respond_to?("speed")
    puts "#{k.class} comfort is #{k.comfort} and has speed of #{k.speed} km/h"
    next
  end
  puts "#{k.class} comfort is #{k.comfort}"
end