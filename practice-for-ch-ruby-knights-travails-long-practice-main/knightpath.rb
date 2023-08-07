require_relative "practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb"

class KnightPathFinder
    def initialize(starting_pos) # [0, 0]
        @starting_pos = starting_pos
        @root_node = PolyTreeNode.new(@starting_pos)
        @move_tree = KnightPathFinder.build_move_tree(@root_node)
        @considered_positions = [@starting_pos]
    end

    attr_reader :root_node, :move_tree

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos) # ex. [[0,0], [1,3]]
        valid_moves.each { |move| valid_moves.delete(move) if @considered_positions.include?(move)}
        valid_moves += @considered_positions
        valid_moves # new positions
    end

    def self.valid_moves(pos) # [4, 4]
        row, col = pos
        new_pos = [[row - 2, col + 1],[row - 2, col - 1]]
        new_pos += [[row + 2, col + 1], [row + 2, col - 1]]
        new_pos += [[row + 1, col + 2], [row - 1, col + 2]]
        new_pos += [[row + 1, col + 2], [row + 1, col + 2]]
    end

    def build_move_tree(@root_node)
        # create children based on possible moves

    end
end
