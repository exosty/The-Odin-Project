class AI
  attr_reader :name

  def initialize name="Sneaky AI"
    @name = "Sneaky AI"
    @possible_codes = [1,2,3,4,5,6].repeated_permutation(4).to_a
  end

  def generate_code
    @possible_codes.sample
  end

  def guess_code(wrong_code, wrong_feedback)
    puts "Last guesstimate: #{wrong_code}. Last feedback #{wrong_feedback}."
    analyze(wrong_code, wrong_feedback)
    @possible_codes.sample
  end

  private

  def analyze(wrong_code, wrong_feedback)
    @possible_codes.delete_if do |possible_code|
      possible_feedback = generate_possible_feedback(possible_code, wrong_code.clone)
      wrong_solution?(possible_feedback,wrong_feedback)
    end
  end

  def generate_possible_feedback(possible_code, wrong_code)
    feedback = Array.new

    possible_code.each_with_index do |item, index|
      if wrong_code.include?(item)
        if item == wrong_code[index]
          feedback << 1
          wrong_code[index]=nil
        else
          feedback << 0
          wrong_code[wrong_code.index(item)]=nil
        end
      else
        feedback << -1
      end
    end
    feedback
  end

  def wrong_solution?(possible_feedback, wrong_feedback)
    return possible_feedback.sort != wrong_feedback.sort ? true : false
  end
end
