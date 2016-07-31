require_relative 'board'
require_relative 'player'

class TicTacToe
  def initialize
    puts "You playing 'X'. Please, enter your name."
    @p1 = Player.new(gets.chomp.capitalize!, 'X')
    puts "You playing 'O'. Please, enter your name."
    @p2 = Player.new(gets.chomp.capitalize!, 'O')

    @board = Board.new
  end

  def start
    @board.show
    make_move(@p1)
  end

  private

  def make_move(player)
    @board.modify(player.move, player.sign)
    @board.show
    if player.win?
      puts "#{player.name} won."
    elsif @board.draw?
      puts "Draw."
    else
      swap_turn(player)
    end
  end

  def swap_turn(player)
    if player == @p1
      make_move(@p2)
    elsif player == @p2
      make_move(@p1)
    end
  end

end

TicTacToe.new.start
