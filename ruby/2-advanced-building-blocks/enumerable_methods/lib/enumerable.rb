module Enumerable

  def my_each
    if block_given?
      i = 0
      while i < self.size
        yield(self[i])
        i+=1
      end
      self
    else
      self.to_enum(:my_each)
    end
  end

  def my_each_with_index
    if block_given?
      i = 0
      while i < self.size
        yield(self[i],i)
        i+=1
      end
      self
    else
      self.to_enum(:my_each_with_index)
    end
  end

  def my_select
    if block_given?
      output = self.class.new
      self.my_each {|e| output << e if yield(e)}
      output
    else
      self.to_enum(:my_select)
    end
  end

  def my_all?
    if block_given?
      self.my_each {|e| return false unless yield(e)}
      true
    else
      self.my_each {|e| return false unless e}
      true
    end
  end

  def my_any?
    if block_given?
      self.my_each {|e| return true if yield(e)}
      false
    else
      self.my_each {|e| return true if e}
      false
    end
  end

  def my_none?
    if block_given?
      self.my_each {|e| return false if yield(e)}
      true
    else
      self.my_each {|e| return false if e}
      true
    end
  end

  def my_count(*args)
    if block_given?
      count=0
      self.my_each {|e| count+=1 if yield(e)}
      count
    else
      unless args.empty?
        count=0
        self.my_each {|e| count+=1 if e == args[0]}
        count
      else
        self.size
      end
    end
  end

  def my_map proc=nil
    if proc.class == "Proc"
      output = Array.new
      self.my_each {|e| output << proc.call(e)}
      output
    elsif block_given?
      output = Array.new
      self.my_each {|e| output << yield(e)}
      output
    else
      self.to_enum(:my_map)
    end
  end

  def my_collect
    if block_given?
      output = Array.new
      self.my_each {|e| output << yield(e)}
      output
    else
      self.to_enum(:my_collect)
    end
  end

  def my_inject(*args)
    case args.size
    when 0
      if block_given?
        i = 1
        memo = self[0]
        while i < self.size
          memo = yield(memo, self[i])
          i+=1
        end
        memo
      end
    when 1
      if block_given?
        i = 1
        memo = args[0]
        while i < self.size
          memo = yield(memo, self[i])
          i+=1
        end
        memo
      else
        i = 1
        memo = self[0]
        while i < self.size
          memo = memo.send args[0], self[i]
          i+=1
        end
        memo
      end
    when 2
      i = 0
      memo = args[0]
      while i < self.size
        memo = memo.send args[1], self[i]
        i+=1
      end
      memo
    end
  end
end
