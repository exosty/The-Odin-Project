require_relative 'person'
require_relative 'ai'
require_relative 'board'

class Mastermind

  def initialize
    puts "Please, enter your name."
    @person = Person.new
    @ai = AI.new
    @attempts = 1

    puts "Enter '1' if u want to be codebreaker."
    puts "Enter '2' if u want to be codemaker."
    @role = gets.chomp.to_i

    play
  end

  def play
    puts "#{codemaker.name}, generate your code of 1..6 numbers."
    make_secret_code
    puts "Code generated!"
    puts ''


    puts "#{codebreaker.name}, try to guess seceret code."
    puts "##{@attempts} attempt."
    first_attempt

    unless codebreaker_win?
      until codebreaker_win? || codemaker_win? do
        puts ''
        @attempts +=1
        puts "##{@attempts} attempt."
        guess
      end
    end
  end

  def guess
    @guesstimate = codebreaker.guess_code(@guesstimate, @feedback)
    @feedback = @board.generate_feedback(@guesstimate.clone)
  end

  def first_attempt
    @guesstimate = codebreaker.generate_code
    @feedback = @board.generate_feedback(@guesstimate.clone)
  end

  def make_secret_code
    @board =  Board.new(codemaker.generate_code)
  end

  def codemaker_win?
    if @attempts >= 12
      puts "#{codemaker.name} won!"
      true
    else
      false
    end
  end

  def codebreaker_win?
    if @board.check(@guesstimate)
      puts "#{codebreaker.name} won!"
      true
    else
      false
    end
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

Mastermind.new
