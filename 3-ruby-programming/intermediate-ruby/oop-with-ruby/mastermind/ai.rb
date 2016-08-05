class AI
  attr_reader :name, :possible_codes

  def initialize pool, name="Sneaky AI"
    @name = "Sneaky AI"

    @possible_codes = pool.repeated_permutation(4).to_a
  end

  def generate_code
    @possible_codes.sample
  end

  def guess(wrong_code, wrong_feedback)
    @possible_codes.each do |code|
      possible_feedback = generate_possible_feedback(code, wrong_code)
      print "#{possible_feedback} + #{code} + #{wrong_code}"
      puts ''
    end
  end

  def generate_possible_feedback(possible_code, wrong_code)
    feedback = Array.new

    possible_code.each_with_index do |item, index|
      if wrong_code.include?(item)
        if item == wrong_code[index]
          feedback << 1
          wrong_code[index]=''
        else
          feedback << 0
          wrong_code[wrong_code.find_index(item)]=''
        end
      else
        feedback << -1
      end
    end
    feedback
  end

  def wrong_solution?(possible_feedback, wrong_feedback)
    return possible_feedback.sort == wrong_feedback.sort ? true : false
  end
end
ai = AI.new([1,2,3,4])
ai.guess([1,1,2,2], [1,-1,0,-1])
