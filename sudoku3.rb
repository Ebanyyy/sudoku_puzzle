string = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'
i = 0
answer = [1,2,3,4,5,6,7,8,9]

def row_solver(sudoku_grid,answer,x)
  y = 0
  while y < 9
    answer.delete(sudoku_grid[x][y])
    y +=1
  end  
end

def column_solver(sudoku_grid,answer,y)
  x = 0
  while x < 9
    answer.delete(sudoku_grid[x][y])
    x +=1
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

def convert_to_array_array(string)    
    string_grid = string.chars.each_slice(9).map(&:join)   
    string_grid = string_grid.map { |row| row.chars.map(&:to_i) }  
    string_grid.each do |row|
        sudoku_grid = row.join(" ")
        puts sudoku_grid
    end
    return string_grid  
end  

puts "\n"
puts "**Unsolved Sudoku**"
sudoku_grid = convert_to_array_array(string)  
puts "\n"
puts "**Solved Sudoku!**"
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