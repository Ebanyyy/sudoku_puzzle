string = '015003002000100906270068430490002017501040380003905000900081040860070025037204600'

sudoku_grid =
[
  [ 0 , 1 , 5 , 0 , 0 , 3 , 0 , 0 , 2 ],
  [ 0 , 0 , 0 , 1 , 0 , 0 , 9 , 0 , 6 ],
  [ 2 , 7 , 0 , 0 , 6 , 8 , 4 , 3 , 0 ],
  [ 4 , 9 , 0 , 0 , 0 , 2 , 0 , 1 , 7 ],
  [ 5 , 0 , 1 , 0 , 4 , 0 , 3 , 8 , 0 ],
  [ 0 , 0 , 3 , 9 , 0 , 5 , 0 , 0 , 0 ],
  [ 9 , 0 , 0 , 0 , 8 , 1 , 0 , 4 , 0 ],
  [ 8 , 6 , 0 , 0 , 7 , 0 , 0 , 2 , 5 ],
  [ 0 , 3 , 7 , 2 , 0 , 4 , 6 , 0 , 0 ]
]

class Sudoku
  def initialize(grid)
    @grid = grid
  end

  def display_grid
  end

  def solve
  end 

  def solve_row
     
  end
end

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
x = 0
while x < 9
  y = 0
  while y < 9
    if sudoku_grid[x][y] == 0
        i = 0
        answer = [1,2,3,4,5,6,7,8,9]
        while i < 9
          #puts sudoku_grid[0][i]
          answer.delete(sudoku_grid[0][i])
          i +=1
        end

        #column
        i = 0
        while i < 9
          answer.delete(sudoku_grid[i][0])
          i +=1
        end

        #grid
        a = 0
        while  a < 3
          b = 0
          while b < 3
            answer.delete(sudoku_grid[a][b])
            b += 1
          end
          a += 1
        end


        if answer.length == 1
          sudoku_grid[x][y] = answer[0]
        end
        puts sudoku_grid[x][y]
    

    else 
      puts sudoku_grid[x][y]
    end



    y += 1
  end
  x += 1
end
