require 'sinatra'

# p directions[3]


# p compass[:n]
directions = ["north", "east", "south", "west"]

compass = {n: 'north', e: 'east', s: 'south', w: 'west'}

class Direction
  attr_reader :abbreviation, :direction_name

  def initialize(abbreviation, direction_name)
      @abbreviation = abbreviation
      @direction_name = direction_name
  end
end
#
# d = Direction.new("n", "North")
# p d.direction_name

class Compass

  attr_reader :directions

  def initialize

    @directions = []
    for direction in ["north", "east", "south", "west"] do
        @directions << Direction.new(direction.chars.first, direction)
    end
  end
end

my_compass = Compass.new
p my_compass.directions
# p my_compass.abbreviation
#
get '/' do

  abbreviation = params[:direction]
  my_compass = Compass.new
  result = my_compass.directions.select do |direction|
    direction.abbreviation == abbreviation
  end.first

  begin
    p result.direction_name
  rescue NoMethodError
    p "Not found"
  end
  # return result.direction_name
end
