require 'set'
class Player
  attr_reader :name, :sign
  @@win_conditions = [[1,2,3],[4,5,6],[7,8,9],
                      [1,4,7],[2,5,8],[3,6,9],
                      [1,5,9],[3,5,7]]
  @@all_moves = []

  def initialize(name, sign)
    @name = name
    @sign = sign
    @moves = []
  end

  def win?
    @@win_conditions.each { |win_condition| return true if win_condition.to_set.subset?(@moves.to_set) }
    false
  end

  def move
    puts "#{@name}, your turn."
    number = gets.chomp.to_i
    if @@all_moves.include?(number) || number<1 || number>9
      abort("#{@name} cheating!")
    else
      @moves << number
      @@all_moves << number
    end
    number
  end

end
