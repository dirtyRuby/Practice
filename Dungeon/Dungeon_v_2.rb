class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  class Player
    attr_accessor :player, :location

    def initialize(player_name)
      @name = player_name
    end

  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end

  end

  class Connections
    attr_accessor :north, :south, :east, :west
    def initialize(con)
      @north = con[:north]
      @south = con[:south]
      @east = con[:east]
      @west = con[:west]
    end
  end


  def add_room(reference, name, description, connections )
    @rooms << Room.new(reference, name, description, connections)
  end

  def create_connection(con)
    Connections.new(con)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections.instance_variable_get("@"+direction.to_s)
  end

  def go(direction)
    puts "You go " + direction.to_s
    a = find_room_in_direction(direction)
    if (a != nil)
      @player.location = find_room_in_direction(direction)
      show_current_description
    else
      puts "Ops! The wall!"
    end
  end
end

new_game = Dungeon.new("Tema")
red = new_game.create_connection(:west=>:greenCave, nil=>nil, nil=>nil, nil=>nil)
green = new_game.create_connection(:north=>:blueCave, nil=>nil, :east=>:redCave, nil=>nil)
blue = new_game.create_connection(nil=>nil, :south=>:redCave, nil=>nil, nil=>nil)

new_game.add_room(:redCave, "Red cave", "Cave with red light", red)
new_game.add_room(:greenCave, "Green cave", "Cave with green light", green)
new_game.add_room(:blueCave, "Blue cave", "Cave with blue light", blue)
new_game.start(:redCave)
new_game.go(:west)
new_game.go(:east)
new_game.go(:west)
new_game.go(:east)
new_game.go(:north)

