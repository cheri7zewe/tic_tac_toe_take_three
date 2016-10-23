require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_new_board_created
		board = Board.new()
		assert_equal([" "," "," "," "," "," "," "," "," "], board.board)
	end

	def test_update_new_board_with_X_at_index_position_0
		board = Board.new()
		board.update_board(0, "X")
		assert_equal(["X"," "," "," "," "," "," "," "," "], board.board)
	end

	def test_update_partially_full_board_with_O_at_index_position_4
		board = Board.new()
		board.board = ["X","O"," "," "," "," ","O"," ","X"]
		board.update_board(4, "O")
		assert_equal(["X","O"," "," ","O"," ","O"," ","X"], board.board)
	end

	def test_partially_full_board_if_index_is_valid
		board = Board.new()
		board.board = ["X","O"," "," "," "," ","O"," ","X"]
		assert_equal(false, board.valid_spot?(0))
		assert_equal(false, board.valid_spot?(15))
		assert_equal(true, board.valid_spot?(2))
		assert_equal(false, board.valid_spot?(-2))
	end

	def test_if_full_board_equals_a_tie_comes_back_true
		board = Board.new()
		board.board = ["X","O","X","O","O","X","O","O","X"]
		assert_equal(true, board.check_for_tie?)
	end

	def test_if_board_equals_a_tie_comes_back_false
		board = Board.new()
		board.board = [" ","O","X","O","O","X","O","O","X"]
		assert_equal(false, board.check_for_tie?)
	end

	def test_for_a_win_with_X
		board = Board.new()
		board.board = ["X","O","X","X","O","O","X","X","O"]
		marker = "X" 
		assert_equal(true, board.check_for_win?(marker))
	end

	def test_for_a_win_with_O
		board = Board.new()
		board.board = ["X","O","X","O","O","O","O","O","X"]
		marker = "O" 
		assert_equal(true, board.check_for_win?(marker))
	end

	def test_for_a_win_with_xs
		board = Board.new()
		board.board = ["O","O","X","X","O","X","X","O","X"]
		marker = "X" 
		assert_equal(true, board.check_for_win?(marker))
	end

	def test_for_a_win_returns_false
		board = Board.new()
		board.board = ["O","X","O","X","O","X","X","O","X"]
		marker = "O" 
		assert_equal(false, board.check_for_win?(marker))
	end

	def test_for_a_win_returns_false1
		board = Board.new()
		board.board = ["O","O","O","O","O","O","X","O","X"]
		marker = "X" 
		assert_equal(false, board.check_for_win?(marker))
	end

end