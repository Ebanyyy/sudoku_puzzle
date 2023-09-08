string = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
i = 0
answer = [1, 2, 3, 4, 5, 6, 7, 8, 9]
   
def row_solver(sudoku_grid,answer,x)
  y = 0
  while y < 9
    #puts sudoku_grid[0][i]
    answer.delete(sudoku_grid[x][y])
    y += 1
  end  
end


def column_solver(sudoku_grid,answer,y)
  x = 0
  while x < 9
    answer.delete(sudoku_grid[x][y])
    x += 1
  end
end

def grid_solver(sudoku_grid,answer,x,y)
  x_counter = 0
  while  x_counter < 3
    y_resetter = y
    y_counter = 0
    while y_counter < 3
      answer.delete(sudoku_grid[x][y_resetter])
      y_resetter += 1
      y_counter += 1
    end
    x += 1
    x_counter += 1
  end
end

def solve(sudoku_grid)
  x = 0
  while x < 9
    y = 0
    while y < 9
      if sudoku_grid[x][y] == 0
        answer = [1,2,3,4,5,6,7,8,9]

        row_solver(sudoku_grid,answer,x)
        column_solver(sudoku_grid,answer,y)
        grid_solver(sudoku_grid,answer,x-x%3,y-y%3)

        if answer.length == 1
          sudoku_grid[x][y] = answer[0]
        end 
      end
      y += 1
    end
    x += 1
  end
end


def convert_to_array(string)
  sudoku_grid = []
  string_grid = string.chars.each_slice(9) do |row|
   sudoku_grid << row.map do |element| element.to_i
   end
  end
    sudoku_grid.each do |row|
      display_cleaner = row.join(" ")
      puts display_cleaner
    end
  return sudoku_grid 
end 

def print_board(sudoku_grid)
  horizontal_line = "+-------+-------+-------+"

  sudoku_grid.each_with_index do |row, i|
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

puts "\n"
puts "Unsolved Sudoku"
sudoku_grid = convert_to_array(string)
puts "\n"
puts "Solved Sudokull"
i = 0
while i < 9
if sudoku_grid[i].include?(0)
  solve(sudoku_grid)
end
i += 1 
end
sudoku_grid.each do |row|
puts row.join(" ")
end
puts "\n"
print_board(sudoku_grid)

