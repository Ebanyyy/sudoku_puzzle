string = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'

# sudoku_grid =
# [
#   [ 0 , 1 , 5 , 0 , 0 , 3 , 0 , 0 , 2 ],
#   [ 0 , 0 , 0 , 1 , 0 , 0 , 9 , 0 , 6 ],
#   [ 2 , 7 , 0 , 0 , 6 , 8 , 4 , 3 , 0 ],
#   [ 4 , 9 , 0 , 0 , 0 , 2 , 0 , 1 , 7 ],
#   [ 5 , 0 , 1 , 0 , 4 , 0 , 3 , 8 , 0 ],
#   [ 0 , 0 , 3 , 9 , 0 , 5 , 0 , 0 , 0 ],
#   [ 9 , 0 , 0 , 0 , 8 , 1 , 0 , 4 , 0 ],
#   [ 8 , 6 , 0 , 0 , 7 , 0 , 0 , 2 , 5 ],
#   [ 0 , 3 , 7 , 2 , 0 , 4 , 6 , 0 , 0 ]
# ]

# class Sudoku
#   def initialize(grid)
#     @grid = grid
#   end


#row
i = 0
answer = [1,2,3,4,5,6,7,8,9]
# while i < 9
#   #puts sudoku_grid[0][i]
#   answer.delete(sudoku_grid[0][i])
#   i +=1
# end

# #column
# i = 0
# while i < 9
#   answer.delete(sudoku_grid[i][0])
#   i +=1
# end


# #grid
# x = 0
# while  x < 3
#   y = 0
#   while y < 3
#     answer.delete(sudoku_grid[x][y])
#     y += 1
#   end
#   x += 1
# end


# # puts answer
#  sudoku_grid[0][0] = answer
# puts sudoku_grid.join

# def display(string)
#   sudoku_grid = string.split("").each_slice(9).to_a
#   sudoku_grid.each do |row|
#     puts row.join(" ")
#   end
# end
  

def row_solver(sudoku_grid,answer,x)
  y = 0
  while y < 9
    #puts sudoku_grid[0][i]
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

def display_unsolve(string)
  sudoku_grid = string.split("").each_slice(9).to_a
  sudoku_grid.each do |row|
    puts row.join(" ")
  sudoku_grid  
  end
end

def display_solved(string)
  sudoku_grid = .split("").each_slice(9).to_a
  sudoku_grid.each do |row|
    puts row.join(" ")
  sudoku_grid  
  end
end

  display_unsolve(string)
  
  i =0
  while i < 9
    if sudoku_grid[i].include? 0
      solve(sudoku_grid)
    end
    i += 1
  end







# puts sudoku_grid.join

# x = string.scan(/.{9}/ )
# puts x.class
# x.each do |e|
#   e.split("")
# end

# puts "#{x}"
solved