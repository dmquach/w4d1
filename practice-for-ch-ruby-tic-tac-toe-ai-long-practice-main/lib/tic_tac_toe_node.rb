require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_board_states = []
    # open_pos = @board.open_positions # empty pos

    # open_pos.each do |pos|
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          dup_board = @board.dup
          dup_board[pos] = @next_mover_mark
          possible_board_states << TicTacToeNode.new(dup_board, dup_board.next_mark, pos)
        end
      end
    end

    possible_board_states
  end
end
