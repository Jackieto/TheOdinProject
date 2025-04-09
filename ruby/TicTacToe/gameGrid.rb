class GameGrid
    def initialize(rows, cols, default_value = nil)
    
        @grid = Array.new(rows) { Array.new(cols, default_value) }
        @rows = rows
        @cols = cols
    end
    def rows
        @rows
    end

    def cols
        @cols
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
                return true  
            end  
            false
    end

    def updateBoard(x,y,player)
       puts "DEBUG: Inside updateBoard - x: #{x.inspect} (type: #{x.class}), y: #{y.inspect} (type: #{y.class})"
        @grid[x][y] = player
    end


    def getRandomEmtpyCell()
        
        x = rand(@rows)
        y = rand(@cols)
        while(!validMove(x,y))
          x = rand(@rows)
          y = rand(@cols)
        end

        return x, y
    end


    def checkForWinner(player)
      # Use the instance variables @rows and @cols
      (0...@rows).each do |i|         
          (0...@cols).each do |j|    
              next unless @grid[i][j] == player

              # Check right (horizontal) - Needs @cols
              if j + 2 < @cols &&      
                 @grid[i][j+1] == player &&
                 @grid[i][j+2] == player
                  return true
              end

              if j - 2 >= 0 &&
                 @grid[i][j-1] == player &&
                 @grid[i][j-2] == player
                  return true
              end

              if i - 2 >= 0 &&
                 @grid[i-1][j] == player &&
                 @grid[i-2][j] == player
                  return true
              end

              # check down (vertical) - Needs @rows
              if i + 2 < @rows &&    
                 @grid[i+1][j] == player &&
                 @grid[i+2][j] == player
                  return true
              end

              # check diagonal (top-left to bottom-right) - Needs @rows and @cols
              # Your original diagonal check only looks from cells where i == j.
              # A full diagonal check is more complex.
              # This corrects the bounds checks based on your original logic:
              if i + 2 < @rows && j + 2 < @cols &&  # Corrected: Use @rows and @cols
                 @grid[i+1][j+1] == player &&
                 @grid[i+2][j+2] == player
                  # If you only want the main diagonal, add back `i == j &&` at the start
                  return true
              end

              # Add check for anti-diagonal (top-right to bottom-left) if needed
              if i + 2 < @rows && j - 2 >= 0 && # Corrected bounds
                  @grid[i+1][j-1] == player &&
                  @grid[i+2][j-2] == player
                  return true
              end

              # Consider adding checks for diagonals starting from i-2, j-2 etc.
              # or simplifying the logic to check in 4 directions (right, down, diag-down-right, diag-down-left)
              # from each cell only.

          end
      end
      return false # Return false if no winner found after checking all cells
    end

end
