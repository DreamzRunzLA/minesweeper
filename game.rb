require_relative 'tile'
require_relative 'board'

class Game
    attr_reader :board

    def initialize(board)
        @board = board
    end

    def get_pos
        pos = nil
        until pos && valid_pos?(pos)
            puts "Please enter a position on the board (e.g., '3,4')"
            print "> "
            pos = parse_pos(gets.chomp)
        end
        pos
    end

    def valid_pos?(pos)
        pos.is_a?(Array) &&
        pos.length == 2 &&
        pos.all? { |x| x.between?(0, board.size - 1) }
    end

    def parse_pos(string)
        string.split(",").map { |char| Integer(char) }
    end

    def won?
        non_bombs = []
        bombs = []
        board.grid.each do |row|
            row.each do |tile|
                if tile.bomb_bool == true
                    bombs << tile
                else
                    non_bombs << tile
                end
            end
        end
        if non_bombs.all? { |tile| tile.reveal_bool == true } && bombs.all? { |tile| tile.bomb_bool == false }
            return true
        else
            return false
        end
    end

    def lost?
        board.grid.each do |row|
            row.each do |tile|
                if tile.bomb_bool == true && tile.revea_bool == true
                    return true
                end
            end
        end
        return false
    end

    def play_turn
        board.render
        puts "Select a tile to reveal"
        pos = get_pos
        if board.grid[pos[0]][pos[1]].bomb_bool == true
            you_lose
        elsif board.grid[pos[0]][pos[1]].neighbor_bomb_count == 0
            board.grid[pos[0]][pos[1]].neighbors.each do |neighbor|
                neighbor.reveal_bool = true
            end
        else
            board.grid[pos[0]][pos[1]].reveal_bool == true
        end

        board.render
        puts "Select a tile to flag"
        pos = get_pos
        board.grid[pos[0]][pos[1]].flag_bool = true
        board.render


        # board.grid[pos[0]][pos[1]].reveal_bool = true
        # board.render
        # puts "Select a tile to flag"
        # pos = get_pos
        # board.grid[pos[0]][pos[1]].flag_bool = true
        # board.render
    end

    def run
        play_turn until won?
        board.render
        puts "Congratulations, you win!"
    end

    def you_lose
        puts "You lose."
        return
    end

end

#User picks a tile
#If it's a bomb, end the game
#Reveal the tile
#Also reveal all adjacents if the selected tile has no bombs nearby
#For all the adjacents, reveal their adjacents if none of them have bombs nearby
#Keep doing this until all adjacents to your outside most tiles have a bomb count > 0
#Allow the user to flag a tile
#Repeat 