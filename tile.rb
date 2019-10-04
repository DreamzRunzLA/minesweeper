#Things to track: bombed? flagged? revealed?
class Tile

    attr_accessor :bomb_bool, :flag_bool, :reveal_bool, :board, :row, :col

    def initialize(board_object)
        @board = board_object
        @bomb_bool = false
        @flag_bool = false
        @reveal_bool = false
        @row = nil
        @col = nil
    end

    def inspect
        if @bomb_bool
            return "B"
        elsif @flag_bool
            return "F"
        else
            return "*"
        end
    end

    def reveal
        @reveal_bool = true
    end

    def neighbors
        neighbors_arr = []

        if self.col == 0

        elsif self.col == @board.size-1

        elsif self.row == 0

        elsif self.row == @board.size-1

        else

        end

        

        left_neighbor = @board.[](self.row, self.col - 1)
        right_neighbor = @board.[](self.row, self.col + 1)
        up_neighbor = @board.[](self.row - 1, self.col)
        down_neighbor = @board.[](self.row + 1, self.col)
        right_up_neighbor = @board.[](self.row - 1, self.col + 1)
        right_down_neighbor = @board.[](self.row + 1, self.col + 1)
        left_up_neighbor = @board.[](self.row - 1, self.col - 1)
        left_down_neighbor = @board.[](self.row + 1, self.col - 1)
    end

    def neighbor_bomb_count

    end
end