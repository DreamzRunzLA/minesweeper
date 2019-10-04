require_relative 'tile'

#Start out with a 9x9 grid
class Board

    attr_reader :grid

    def initialize(size=9)
        @size = size
        @grid = Array.new(size) { Array.new(size) {Tile.new(self)} }
    end

    #13 bombs spread out over 81 squares randomly

end