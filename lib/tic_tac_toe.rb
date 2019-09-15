require 'pry'
require 'matrix'

class TicTacToe

	attr_accessor :board

	WIN_COMBINATIONS = Array.new#(8, [])

		
		#winning row combinations
		winning_columns = []
		rows = (0..8).to_a
		winning_rows = rows.each_slice(3).to_a
		winning_rows.each {|row| WIN_COMBINATIONS.push(row)} 

		#winning column combinations
		winning_columns = winning_rows.transpose
		winning_columns.each {|col| WIN_COMBINATIONS.push(col)} 


		#trying to establish the 2 diagonal combinations => [[0,4,8], [2,4,6]]
   		#winning_rows = [[0,1,2],[3,4,5], [6,7,8]]
   		
   		winning_diagonals1 = []
		winning_diagonals1 = Matrix.rows(winning_rows).each(:diagonal).to_a
		WIN_COMBINATIONS.push(winning_diagonals1) 

		#reversed winning_row and used Matrix class again
		winning_diagonals2 = []
		winning_diagonals2 = Matrix.rows(winning_rows.reverse).each(:diagonal).to_a
		WIN_COMBINATIONS.push(winning_diagonals2) 

	

	def initialize 
		@board =  Array.new(9, " ")
	end

	def display_board


	    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	    puts "-----------"
	    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	    puts "-----------"
	    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

	end

	def input_to_index(input)
		
		#input must convert to arrray friendly values bef=giining at 0 

		input_num = input.to_i
		input_num-=1

	end	

	def move(grid_position, token)

		#rid_position = grid_position.to_i
		 @board[grid_position] = token

	end

	def position_taken?(position)

		(@board[position] == "X" || @board[position] == "O") ? true : false

	end

	def valid_move?(position)

		# position = position.to_i
		# @board[position] == " " ? true : false

		position.between?(0,8) && !position_taken?(position)

	end

	def turn_count
	
		@board.count("X") + @board.count("O")
	
	end

	def current_player

		if turn_count == 0 || turn_count.even?
			"X"
		elsif 
			turn_count.odd?
			"O"
		end

	end

	def turn

		puts "Input a number between 1-9"
		num = gets.strip
		pos_num = input_to_index(num)

		if  valid_move?(pos_num) 
			token = current_player
			move(pos_num, token)
			display_board

		else
			turn
		end

	end

	def won?
		#creates two separate arrays one for x's and the other for o's that occupies
		#positions on the board
		#uses class contsant WIN_COMBINATIONS and interates to compare the x positions as
		#well as the o positions and breaks out of loop is ther is a match 


		x_index_array = []
		o_index_array = []
		winner = []

		@board.each_with_index do |token, index|

			if token == "X"
				x_index_array << index

			elsif 
				token == "O"
				o_index_array << index

				end
			
			end
		

		WIN_COMBINATIONS.each do |win|

				if (win & x_index_array).size == 3
					winner = win
					break
				elsif
					(win & o_index_array).size == 3
					 winner = win
					 break

					else	
						winner = false
					end
			end
			winner
		end


		def full?
			#returns true for a draw and returns false for an in progress game
			
			draw? ? true : false
			@board.include?(" ") ? false : true
				
		end
 
		def draw?
			#returns true for a draw and returns false for a win or a game in progress

			won? != false ? true : false 
			@board.include?(" ") || won? ? false : true

		
		end


		def over?

			draw? || won?

		end

		def winner

			@board[won?.first] if won? 

		end

		def play

			turn until over?

			if won? 

				puts "Congratulations #{winner}!"

			elsif draw?

				puts "Cat's Game!"

			end

		end

	end