class Board
  attr_reader :secret_code, :feedback, :codes

  def initialize secret_code
    @secret_code = secret_code
    @codes = Array.new
    @feedbacks = Array.new

  end

  def check code
    feedback = Array.new
    @codes << code

    @secret_code.each_with_index do |item, index|
      if code.include?(item)
        if item == code[index]
          feedback << 1
          code[index]=nil
        else
          feedback << 0
          code[code.find_index(item)]=nil
        end
      else
        feedback << -1
      end
    end
    @feedbacks << feedback.shuffle!

    @feedbacks
  end

end
