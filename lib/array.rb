require 'pry'
require 'matrix'

	def create_arrays
		rows = (0..8).to_a
		winning_columns = []
		winning_diagonals1 = []
		winning_diagonals2 = []
		
		#winning row combinations
		winning_rows = rows.each_slice(3).to_a
		puts "winning rows #{winning_rows}"

		#winning column combinations
		winning_columns = winning_rows.transpose
		puts "winning columns #{winning_columns}"

		#trying to establish the 2 diagonal combinations => [[0,4,8], [2,4,6]]
   		#winning_rows = [[0,1,2],[3,4,5], [6,7,8]]
   		
		winning_diagonals1 = Matrix.rows(winning_rows).each(:diagonal).to_a
		puts "winning diagonals 1 #{winning_diagonals1}"

		winning_diagonals2 = Matrix.rows(winning_rows.reverse).each(:diagonal).to_a
		puts "winning diagonals 2 #{winning_diagonals2}"


		#long way to get winning column combinations 
		# winning_columns = []
		# winning_diagonal = []
		# cnt = 0
		# i = 0

	
		# 	while cnt < 3
		# 	winning_rows.each do |row|
				
		# 		row.each_with_index do |col, indx|
		# 			winning_columns << col if i == indx
		# 			winning_diagonal << col if col % 2 == 0
		# 		end
					

		# 		end 
		# 		cnt+=1
		# 		i+=1
		# 	end
		# 	binding.pry
	end

	create_arrays


