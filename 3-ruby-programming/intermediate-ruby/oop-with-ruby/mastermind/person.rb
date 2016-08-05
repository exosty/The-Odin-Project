class Person
  attr_reader :name

  def initialize name
    @name = name
  end

  def generate_pool
    puts "#{name}, enter pool of numbers to play with."
    pool = gets.chomp.scan(/\d/)
  end

  def generate_code pool
    puts "#{name}, enter 4-sign length code containing only #{pool}."
    code = gets.chomp.scan(/\d/)
  end

  def guess pool
    generate_code pool
  end
end
