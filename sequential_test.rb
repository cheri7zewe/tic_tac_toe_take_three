require "minitest/autorun"
require_relative "sequential.rb"

class TestSequentialAI < Minitest::Test

	def test_first_available_space_returned
        player = SequentialAI.new("X")
        assert_equal(0, player.get_move([" "," "," "," "," "," "," "," "," "]))
        assert_equal(2, player.get_move(["O","O"," "," "," "," "," "," "," "]))
    	assert_equal(4, player.get_move(["O","O","X","X"," "," "," "," "," "]))
    end

    def test_for_creating_player
        player = SequentialAI.new("X")
        assert_equal("X", player.marker)
    end

end