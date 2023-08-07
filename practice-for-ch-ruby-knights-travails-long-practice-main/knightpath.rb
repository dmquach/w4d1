require_relative "tree_node.rb"

require "byebug"

class KnightPathFinder
    def initialize(starting_pos) # [0, 0]
        @starting_pos = starting_pos
        @root_node = PolyTreeNode.new(@starting_pos)
        @considered_positions = [@starting_pos]
        @move_tree = self.build_move_tree
    end

    attr_reader :root_node, :move_tree

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos) # ex. [[0,0]
        valid_moves.select! { |move| !@considered_positions.include?(move) } # if not included
        @considered_positions += valid_moves
        valid_moves # all new positions
    end

    def self.valid_moves(pos) # [4, 4]
        row, col = pos
        new_pos = [[row - 2, col + 1],[row - 2, col - 1]]
        new_pos += [[row + 2, col + 1], [row + 2, col - 1]]
        new_pos += [[row - 1, col + 2], [row - 1, col - 2]]
        new_pos += [[row + 1, col + 2], [row + 1, col - 2]]

        new_pos.select {|coordinate| self.valid?(coordinate)}
    end

    def self.valid?(pos) #[x,x]
        row, col = pos
        return false if row < 0 || row > 7
        return false if col < 0 || col > 7
        true
    end

    def build_move_tree
        # create children based on possible moves
        queue = [@root_node]

        while !queue.empty?
            parent_node = queue.shift

            val_moves = self.new_move_positions(parent_node.value)

            val_moves.each do |move|
                move_node = PolyTreeNode.new(move)
                parent_node.add_child(move_node)
                queue << move_node
            end

        end

    end
end
