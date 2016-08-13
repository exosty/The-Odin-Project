class Person
  attr_reader :name

  def initialize
    @name = gets.chomp.capitalize
  end

  def guess_code(wrong_code, wrong_feedback)
    puts "Last guesstimate: #{wrong_code}. Last feedback #{wrong_feedback}."
    generate_code
  end

  def generate_code
    code = enter_code
  end

  private

  def enter_code
    value = gets.chomp.scan(/\d/)
    value.map! do |item|
      item.to_i
    end
  end
end
