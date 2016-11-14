class UnbeatableAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		cpu_marker = marker
		
		if cpu_marker == "O"
			player_marker = "X"
		else
			player_marker = "O"
		end

		if check_for_win(board, cpu_marker) <= 8
			move = check_for_win(board, cpu_marker)
			move = move + 1
		elsif check_for_block(board, player_marker) <= 8
			move = check_for_block(board, player_marker)
			move = move + 1
		elsif check_for_fork(board) <= 8
			move = check_for_fork(board)
			move = move + 1
		elsif block_opponents_fork(board, cpu_marker) <= 8
			move = block_opponents_fork(board, cpu_marker)
			move = move + 1
		elsif check_for_center(board) <= 8
			move = check_for_center(board)
			move = move + 1
		elsif opponent_corner(board) <= 8
			move = opponent_corner(board)
			move = move + 1
		elsif check_empty_corner(board) <= 8
			move = check_empty_corner(board)
			move = move + 1
		elsif check_empty_side(board) <=8
			move = check_empty_side(board)
			move = move + 1
		else
			move = board.index(" ")
		end
		move
	end

	def check_for_win(board, your_marker)
		win_or_block(board, your_marker)
	end

	def check_for_block(board, player_marker)
		win_or_block(board, player_marker)
	end

	def win_or_block(board, current_marker)
		winning_or_block_combinations = [
							[board[0],board[1],board[2]],
							[board[3],board[4],board[5]],
							[board[6],board[7],board[8]],
							[board[0],board[3],board[6]],
							[board[1],board[4],board[7]],
							[board[2],board[5],board[8]], 
							[board[0],board[4],board[8]],
							[board[2],board[4],board[6]]
							]

		win_or_block_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		move = 10
		
		winning_or_block_combinations.each_with_index do |win_or_block_line, index|
			if win_or_block_line.count(current_marker) == 2 && win_or_block_line.count(" ") == 1
				winner_or_block = win_or_block_line.index(" ")
				i = index
				move = win_or_block_positions[i][winner_or_block]
			end
		end
		move
	end

	def check_for_fork(board)
		fork_combinations = [
							[board[0],board[1],board[2]],
							[board[3],board[4],board[5]],
							[board[6],board[7],board[8]],
							[board[0],board[3],board[6]],
							[board[1],board[4],board[7]],
							[board[2],board[5],board[8]], 
							[board[0],board[4],board[8]],
							[board[2],board[4],board[6]]
							]

		fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		fork_line = []
		fork_spot = []
		i = []
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count(" ") == 2
				fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot.push(fork_positions[index])
		end

		fork_spot = fork_spot.flatten.sort

		conditional_array = []
		fork_spot.each do |spot|
			if ttt_board[spot] == " "
				conditional_array.push(spot)
			end
		end

		if conditional_array.detect { |match| conditional_array.count(match) > 1 } == nil
			move = 10
		else
			move = conditional_array.detect { |match| conditional_array.count(match) > 1 }
		end
		move
	end

	def block_opponents_fork(board, cpu_marker)
		block_fork_combinations = [
								[board[0],board[1],board[2]],
								[board[3],board[4],board[5]],
								[board[6],board[7],board[8]],
								[board[0],board[3],board[6]],
								[board[1],board[4],board[7]],
								[board[2],board[5],board[8]], 
								[board[0],board[4],board[8]],
								[board[2],board[4],board[6]]
								]

		block_fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		if cpu_marker == "O"
			player_marker = "X"
		else
			player_marker = "O"
		end

		block_fork_line = []
		block_fork_spot = []
		i = []
		
		block_fork_combinations.each_with_index do |block_forking_line, index|
			if block_forking_line.count(player_marker) == 1 && block_forking_line.count(" ") == 2
				block_fork_line = block_forking_line
				i.push(index)
			end
		end

		i.each do |index|
			block_fork_spot.push(block_fork_positions[index])
		end

		block_fork_spot = block_fork_spot.flatten.sort

		block_spot = []

		if block_fork_spot.include?(4)
			move = 10
		else
			block_fork_spot.each do |spot|
				if board[spot] == "X" && board[spot + 1] == " "
					block_spot.push(spot + 1)
				else
					move = 10
				end
			end
		end

		if block_spot == []
			move = 10
		else
			move = block_spot.shift
		end

		move
	end

	def check_for_center(board)
		if board[4] == " "
			move = 4
		else
			move = 10
		end
	end

	def opponent_corner(board)
		cpu_marker = marker
		
		if cpu_marker == "O"
			player_marker = "X"
		else
			player_marker = "O"
		end

		if board[0] == player_marker && board[8] == " "
			move = 8
		elsif board[2] == player_marker && board[6] == " "
			move = 6
		elsif board[6] == player_marker && board[2] == " "
			move = 2
		elsif board[8] == player_marker && board[0] == " "
			move = 0
		else
			move = 10
		end
		move
	end

	def check_empty_corner(board)
		if board[0] == " "
			move = 0
		elsif board[2] == " "
			move = 2
		elsif board[6] == " "
			move = 6
		elsif board[8] == " "
			move = 8
		else
			move = 10
		end
	end

	def check_empty_side(board)
		sides = [1, 3, 5, 7]
		side_options = []

		sides.each do |side|
			if board[side] == " "
				side_options.push(side)
			end
		end
		first_side_available = side_options.shift
	end

end