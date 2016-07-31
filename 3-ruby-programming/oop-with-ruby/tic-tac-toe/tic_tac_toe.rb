require_relative 'board'
require_relative 'player'

class TicTacToe
  def initialize
    puts "Please, introduce yourself X-player."
    @p1 = Player.new(gets.chomp.capitalize!, 'x')
    puts "Please, introduce yourself O-player."
    @p2 = Player.new(gets.chomp.capitalize!, 'o')

    @board = Board.new

    make_move(@p1)
  end

  private

  def make_move(player)
    @board.show
    puts "Please, make move #{player.name}."
    number = gets.chomp.to_i
    @board.modify(number, player.sign)
    if @board.win?
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
    else
      make_move(@p1)
    end
  end

end
TicTacToe.new
