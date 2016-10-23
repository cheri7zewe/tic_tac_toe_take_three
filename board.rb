class Board

	attr_accessor :board

	def initialize()
		@board = [" "," "," "," "," "," "," "," "," "]
	end

	def update_board(index, marker)
		board[index] = marker
	end

	def valid_spot?(index)
		index >= 0 && index <= 8 && board[index] == " "
	end

	def check_for_tie?
		board.count(" ") == 0
	end

	def check_for_win?(marker)
		result = false
		winning_combinations = [[board[0], board[1], board[2]],
								[board[3], board[4], board[5]],
								[board[6], board[7], board[8]],
								[board[0], board[3], board[6]],
								[board[1], board[4], board[7]],
								[board[2], board[5], board[8]], 
								[board[0], board[4], board[8]],
								[board[2], board[4], board[6]]]
		winning_combinations.each do |winner|
			if winner.count(marker) == 3
				result = true
			end
		end
		result
		
	end

end