# this is the sudoku in string 015003002000100906270068430490002017501040380003905000900081040860070025037204600

module SudokuSolver # grouping the classes, methods and contants together
    class Sudoku
      def initialize(board) # assigns the board to an instance variable @board
        @board = board
      end
      
      def solve
        solve_sudoku
        print_board
      end
      
      private # to keep methods within the class and cannot be called from outside
      
      def solve_sudoku # the actual solving / recursive method using backtracking algorithm
        row, col = find_empty_cell
        
        return true if row.nil? # All cells filled, Sudoku solved!
        
        (1..9).each do |num|
          if valid_move?(row, col, num)
            @board[row][col] = num
            
            if solve_sudoku
              return true
            else
              @board[row][col] = 0 # Backtrack if the solution is not valid
            end
          end
        end
        
        false # No valid solution found
      end
      
      def find_empty_cell # finds the empty cell
        @board.each_with_index do |row, i|
          row.each_with_index do |cell, j|
            return [i, j] if cell == 0
          end
        end
        
        nil # No empty cell found
      end
      
      def valid_move?(row, col, num) # to ensure numbers not used in the same row, column and box
        !used_in_row?(row, num) &&
          !used_in_column?(col, num) &&
          !used_in_box?(row - row % 3, col - col % 3, num)
      end
      
      def used_in_row?(row, num)
        @board[row].include?(num)
      end
      
      def used_in_column?(col, num)
        @board.transpose[col].include?(num)
      end
      
      def used_in_box?(start_row, start_col, num) # used_in checks for used numbers
        (0..2).each do |i|
          (0..2).each do |j|
            return true if @board[start_row + i][start_col + j] == num
          end
        end
        
        false
      end
      
      def print_board
        horizontal_line = "+-------+-------+-------+"
      
        @board.each_with_index do |row, i|
          puts horizontal_line if i % 3 == 0
          row.each_with_index do |cell, j|
            print "| " if j % 3 == 0
            print "#{cell} "
            print "| " if j == 8
          end
          puts
        end
        puts horizontal_line
      end
    end
  end
  
  # Usage example
  board = [
    [0, 1, 5, 0, 0, 3, 0, 0, 2],
    [0, 0, 0, 1, 0, 0, 9, 0, 6],
    [2, 7, 0, 0, 6, 8, 4, 3, 0],
    [4, 9, 0, 0, 0, 2, 0, 1, 7],
    [5, 0, 1, 0, 4, 0, 3, 8, 0],
    [0, 0, 3, 9, 0, 5, 0, 0, 0],
    [9, 0, 0, 0, 8, 1, 0, 4, 0],
    [8, 6, 0, 0, 7, 0, 0, 2, 5],
    [0, 3, 7, 2, 0, 4, 6, 0, 0]
  ]
  
  sudoku = SudokuSolver::Sudoku.new(board)
  sudoku.solve