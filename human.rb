class Human

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		#  "Pick a space"
		# move = gets.chomp.to_i
		# if board[move] == " "
		# 	move
		# else
		# 	 "invalid space"
		# 	get_move(board)
		# end
		"no"
	end
end