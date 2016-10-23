class RandomAI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		# create a new array with index with empty stings and randomly select them
		move = []
		i = 0
		board.each do  |board_spot|

			if board_spot == " "
				move.push(i)
			end
			i = i + 1
		end
		
			move.sample

	end
end