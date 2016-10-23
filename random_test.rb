require "minitest/autorun"
require_relative "random.rb"

class TestRandomAI < Minitest::Test

    def test_random_available_space_returned
    	player = RandomAI.new("X")
        assert_equal(4, player.get_move(["X","O","X","O"," ","X","O","X","O"]))
    end

    def test_for_available_position_returned_using_random_ai_and_multiple_open_positions
        player = RandomAI.new("X")
        assert_equal(true, [3,4].include?(player.get_move(["X","O","X"," "," ","X","O","X","O"])))
	end

	def test_for_new_player
		player = RandomAI.new("X")
		assert_equal("X", player.marker)
	end

end