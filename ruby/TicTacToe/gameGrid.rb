class GameGrid
    def initialize(rows, cols, default_value = nil)
    
        @grid = Array.new(rows) { Array.new(cols, default_value) }
        @rows = rows
        @cols = cols
    end

    def display
        puts @grid.to_a.map(&:inspect)
    end

    def fullBoard?
        @grid.each do |row|
            return false if row.include?(nil)
        end
        return true
    end

    def validMove(x,y)
            if @grid[x][y] == nil
                retun true  
            end  
            puts "Position: " + x,y + "not empty"
            puts "Choose another one"
            false
    end

    def updateBoard(x,y,player)
      if one
          
      end

    end

    def checkForWinner(player)
              (0...@grid.rows).each do |i|
                (0...@grid.cols).each do |j|
                    next unless @grid[i][j] == player
                    #Check right (horizontal)
                    if j + 2 < @grid.cols &&
                        @grid[i][j+1] == player &&
                        @grid[i][j+2] == player 
                        return true 
                    end  
                    #check left (horizontal)
                    if j - 2 >= 0  &&
                        @grid[i][j-1] == player &&
                        @grid[i][j-2] == player 
                        return true 
                    end

                    #check up (vertical)

                    if i - 2 >= 0 &&
                        @grid[i-1][j] == player &&
                        @grid[i-2][j] == player  
                        return true 
                    end

                    #check down (vertical)
                    if i + 2 < @grid.rows &&
                        @grid[i+1][j] == player &&
                        @grid[i+2][j] == player  
                        return true 
                    end
                end  

                    #check diagonal
                    if i==j && (i+2) < @grid.rows && (j+2)  < @grid.cols &&
                        @grid[i+1][j+1] == player &&
                        @grid[i+2][j+2] == player
                        return true  
                    end

            end
    end



end
