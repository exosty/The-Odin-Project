require_relative 'person'
require_relative 'ai'
require_relative 'board'

class Mastermind
  def initialize
    puts "Enter your name."
    @person = Person.new(gets.chomp.capitalize!)
    @pool = @person.enter_pool
    @ai = AI.new(@pool)
    puts "You codebreaker(1) or codemaker(2)?"
    @role = gets.chomp.to_i
    @attempts = 0
  end

  def start
    @board = Board.new(codemaker.enter_code(@pool))
    p @board.secret_code

    puts "#{guess.name} won!"
  end

  def guess
    while @attempts<12 do
      @attempts+=1
      puts "It's #{codebreaker.name}'s #{@attempts} attempt."
      guesstimate = codebreaker.guess_code(@pool)
      feedbacks = @board.check(guesstimate)
      p feedbacks.last
      if feedbacks.last == [1,1,1,1]
        return codebreaker
      end
    end

    codemaker
  end

  def codemaker
    return @ai if @role == 1
    return @person if @role == 2
  end

  def codebreaker
    return @ai if @role == 2
    return @person if @role == 1
  end
end

mastermind = Mastermind.new
mastermind.start
