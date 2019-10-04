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

    end

    def neighbor_bomb_count

    end
end