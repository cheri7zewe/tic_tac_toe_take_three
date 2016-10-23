require_relative "sequential.rb"
require_relative "human.rb"
require_relative "random.rb"
require_relative "board.rb"
require_relative "unbeatable.rb"

class ConsoleGame
	attr_accessor :p1, :p2, :board, :current_player

	def initialize(p1, p2)
		@p1 = p1
		@p2 = p2
		@board = Board.new
		@current_player = p2
	end

	def change_player
		if @current_player == p1
			@current_player = p2
		else
			@current_player = p1
		end
	end

	def start_game()
		puts "Welcome to Tic-Tac-Toe"
	end

	def board_status()
	 	puts " #{board.board[0]} | #{board.board[1]} | #{board.board[2]} "
	 	puts "-----------"
	 	puts " #{board.board[3]} | #{board.board[4]} | #{board.board[5]} "
	 	puts "-----------"
	 	puts " #{board.board[6]} | #{board.board[7]} | #{board.board[8]} "
	 	puts

	 	if current_player == p2
	 		player = p1
	 	else
	 		player = p2
	 	end

	 	if board.game_won?(current_player.marker) == false && board.game_ends_in_tie?() == false
			puts "It is #{player.marker} turn."
		end	
	end

	def get_player_move
		current_player.get_move(board.board)
	end

	def make_move(move)
		board.update_board(move, current_player.marker)
	end

	def game_over?
		board.game_won?(current_player.marker) ||
		board.game_ends_in_tie?()
	end

	def winner
		if board.game_won?(current_player.marker)
			puts "#{current_player.marker} is the winner!"
		else
			puts "The game is a tie."
		end
	end
end 