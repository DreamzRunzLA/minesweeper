#Things to track: bombed? flagged? revealed?
class Tile

    def initialize(board_object, bombs=13)
        @board = board_object
        @bombs = bombs
        @bombed = false
        @flagged = false
        @revealed = false
    end

    def randomize
        rows = @board.grid.length
        cols = @board.grid[0].length

        while i < 13
            new_row = rand(9)
            new_col = rand(9)

            if @board.grid[new_row][new_col] != "B"

            end
        end

    end


    def reveal

    end


    def neighbors

    end


    def neighbor_bomb_count

    end
end