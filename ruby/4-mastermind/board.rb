class Board
  def initialize secret_code
    @secret_code = secret_code
  end

  def check(code)
    if code == @secret_code
      true
    else
      false
    end
  end

  def generate_feedback(code)
    feedback = Array.new

    @secret_code.each_with_index do |item, index|
      if code.include?(item)
        if item == code[index]
          feedback << 1
          code[index]=nil
        else
          feedback << 0
          code[code.index(item)]=nil
        end
      else
        feedback << -1
      end
    end

    feedback.shuffle!
  end
end
