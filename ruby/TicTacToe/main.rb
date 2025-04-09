require_relative 'gameGrid'

def playGame(grid)

  player = "X"
  cpu = "O"
  while !grid.fullBoard? 
      
    grid.display
    puts "Player #{player}, choose a move (row col), e.g., 0 1"
    input = gets.chomp.split
    
    # Basic input validation (check if exactly two numbers were entered)
    if input.length == 2 && input.all? { |s| s.match?(/\A\d+\z/) }
        x, y = input.map(&:to_i)
    else
        puts "Invalid input format. Please enter row and column numbers separated by a space."
        next # Skip the rest of the loop and ask again
    end

     # Add boundary check - make sure x and y are within the grid
     if x < 0 || x >= grid.rows || y < 0 || y >= grid.cols
      puts "Coordinates out of bounds! Row must be 0-#{grid.rows-1}, Col must be 0-#{grid.cols-1}."
      next # Skip the rest of the loop and ask again
     end

     if grid.validMove(x,y)
        grid.updateBoard(x,y,player)

       if grid.checkForWinner(player)   
          grid.display    
          puts "You WIN!"
          return 
       end
     else 
        puts "Cell occupied or out of bounds!"
        next

     end

     cpu_x, cpu_y = grid.getRandomEmtpyCell
     grid.updateBoard(cpu_x,cpu_y,cpu)
     puts "CPU MOVE = {cpu_x, cpu_y}"
     grid.display
     if grid.checkForWinner(cpu)
        puts "CPU WINS!"
        return
     end

     if grid.fullBoard?
             puts "IT'S A TIE!"
             return
     end
  end
    
end
puts "LET'S PLAY TIC TAC TOE!"
game_grid = GameGrid.new(3,3)
playGame(game_grid)