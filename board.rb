require_relative 'tile'

#Start out with a 9x9 grid
class Board

    attr_accessor :grid, :size

    def initialize(size=9)
        @size = size
        @grid = Array.new(size) { Array.new(size) {Tile.new(self)} }
        place_bombs
        add_pos_to_tiles
    end

    #13 bombs spread out over 81 squares randomly
    def place_bombs
        number_bombs = ((@size**2)/(100/16)).floor

        until number_bombs == 0
            new_row = rand(8)
            new_col = rand(8)

            if self.[](new_row, new_col).bomb_bool == false
                self.[](new_row, new_col).bomb_bool = true
                puts "placed a bomb!"
                number_bombs -= 1
            end
        end
    end

    def add_pos_to_tiles
        self.grid.each_with_index do |row1, ind1|
            row1.each_with_index do |col1, ind2|
                self.[](ind1, ind2).row = ind1
                self.[](ind1, ind2).col = ind2
            end
        end
    end

    def render
        system("clear")
        puts "  #{(0...@grid.length).to_a.join('  ')}"
        @grid.each_with_index do |row, i|
            puts "#{i} #{row}"
        end
    end

    #important method that will allow you to take 2 ints and access the grid
    #using nested array syntax
    def [](pos1, pos2)
        if valid_pos?(pos1, pos2)
            @grid[pos1][pos2]
        else
            puts "Invalid position"
        end
    end

    def valid_pos?(pos1, pos2)
        if pos1 < @size && pos2 < @size
            return true
        else
            return false
        end
    end

end