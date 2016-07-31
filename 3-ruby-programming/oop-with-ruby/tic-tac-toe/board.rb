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
    if @board.count('X') + @board.count('O') == 9
      true
    else
      false
    end
  end
end
