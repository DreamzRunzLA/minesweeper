#Things to track: bombed? flagged? revealed?
class Tile

    attr_accessor :bomb_bool, :flag_bool, :reveal_bool, :board, :row, :col, :bomb_count

    def initialize(board_object)
        @board = board_object
        @bomb_bool = false
        @flag_bool = false
        @reveal_bool = false
        @row = nil
        @col = nil
        @bomb_count = nil
    end

    def inspect
        if reveal_bool
            if @bomb_bool
                return "B"
            elsif @flag_bool
                return "F"
            else
                return @bomb_count.to_s
            end
        else
            return "*"
        end
    end

    def reveal
        @reveal_bool = true
    end

    def neighbors
        neighbors_arr = []

        #corner cases
        if self.row == 0 && self.col == 0
            neighbors_arr << self.board.grid[self.row][self.col + 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col]
            neighbors_arr << self.board.grid[self.row + 1][self.col + 1]
        elsif self.row == 0 && self.col == @board.size - 1
            neighbors_arr << self.board.grid[self.row][self.col - 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col - 1]
        elsif self.row == @board.size - 1 && self.col == 0
            neighbors_arr << self.board.grid[self.row][self.col + 1]
            neighbors_arr << self.board.grid[self.row - 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col + 1]
        elsif self.row == @board.size - 1 && self.col == @board.size - 1
            neighbors_arr << self.board.grid[self.row][self.col - 1]
            neighbors_arr << self.board.grid[self.row - 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col - 1]
        #edge cases
        elsif self.row == 0
            neighbors_arr << self.board.grid[self.row][self.col - 1]
            neighbors_arr << self.board.grid[self.row][self.col + 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col]
            neighbors_arr << self.board.grid[self.row + 1][self.col - 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col + 1]
        elsif self.row == @board.size - 1
            neighbors_arr << self.board.grid[self.row][self.col - 1]
            neighbors_arr << self.board.grid[self.row][self.col + 1]
            neighbors_arr << self.board.grid[self.row - 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col - 1]
            neighbors_arr << self.board.grid[self.row - 1][self.col + 1]
        elsif self.col == 0
            neighbors_arr << self.board.grid[self.row - 1][self.col]
            neighbors_arr << self.board.grid[self.row][self.col + 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col + 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col + 1]
        elsif self.col == @board.size - 1
            neighbors_arr << self.board.grid[self.row - 1][self.col]
            neighbors_arr << self.board.grid[self.row][self.col - 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col - 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col - 1]
        #base case
        else
            neighbors_arr << self.board.grid[self.row][self.col - 1]
            neighbors_arr << self.board.grid[self.row][self.col + 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col]
            neighbors_arr << self.board.grid[self.row - 1][self.col - 1]
            neighbors_arr << self.board.grid[self.row - 1][self.col + 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col - 1]
            neighbors_arr << self.board.grid[self.row + 1][self.col + 1]
        end

        return neighbors_arr
    end

    def neighbor_bomb_count
        count = 0

        self.neighbors.each do |neighbor|
            if neighbor.bomb_bool == true
                count += 1
            end
        end

        return count
    end

end