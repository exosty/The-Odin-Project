class Board
  def initialize
    @board = Array.new(9){|i| i+1}
  end

  def show
    puts ''
    i=0
    3.times do
      3.times do
        print "#{@board[i]} "
        i+=1
      end
      puts ''
    end
  end

  def modify(number,sign)
    @board[number-1] = sign
  end

  def draw?
    if @board.count('x') + @board.count('o') == 9
      true
    else
      false
    end
  end

  def win?
    if lines? || columns? || diagonals?
      true
    else
      false
    end
  end

  private

  def lines?
    if ((@board[0] == @board[1] && @board[1] == @board[2]) ||
      (@board[3] == @board[4] && @board[4] == @board[5]) ||
      (@board[6] == @board[7] && @board[7] == @board[8]))
      true
    else
      false
    end
  end

  def columns?
    if ((@board[0] == @board[3] && @board[3] == @board[6]) ||
      (@board[1] == @board[4] && @board[4] == @board[7]) ||
      (@board[2] == @board[5] && @board[5] == @board[8]))
      true
    else
      false
    end
  end

  def diagonals?
    if (@board[0] == @board[4] && @board[4] == @board[8]) ||
       (@board[2] == @board[4] && @board[4] == @board[6])
      true
    else
      false
    end
  end
end
