require 'enumerable'

RSpec.describe Enumerable do
  before (:each) do
    @a = [1,2,3]
  end

  describe "#my_each" do
    it "works as Enumerable#each" do
      a1 = Array.new
      a2 = Array.new

      @a.my_each {|e| a1<<e }
      @a.each {|e| a2<<e }

      expect(a1).to eq(a2)

      b1 = @a.my_each.class
      b2 = @a.each.class

      expect(b1).to eq(b2)
    end
  end

  describe "#my_each_with_index" do
    it "works as Enumerable#each_with_index" do
      a1 = Array.new
      a2 = Array.new

      @a.my_each_with_index {|item, index| a1<<item+index }
      @a.each_with_index {|item, index| a2<<item+index }

      expect(a1).to eq(a2)

      b1 = @a.my_each_with_index.class
      b2 = @a.each_with_index.class

      expect(b1).to eq(b2)
    end
  end

  describe "#my_select" do
    it "works as Enumerable#select" do
      a1 = Array.new
      a2 = Array.new

      a1 = @a.my_select {|e| e.even? }
      a2 = @a.select {|e| e.even? }

      expect(a1).to eq(a2)

      b1 = @a.my_select.class
      b2 = @a.select.class

      expect(b1).to eq(b2)
    end
  end

  describe "#my_all?" do
    it "works as Enumerable#all?" do
      b = [nil, true, 99]

      a1 = @a.my_all? {|e| e.even?}
      a2 = @a.all? {|e| e.even?}

      expect(a1).to eq(a2)

      b1 = @a.my_all?
      b2 = @a.all?

      expect(b1).to eq(b2)
    end
  end

  describe "#my_any?" do
    it "works as Enumerable#any?" do
      b = [nil, true, 99]

      a1 = @a.my_any? {|e| e.even?}
      a2 = @a.any? {|e| e.even?}

      expect(a1).to eq(a2)

      b1 = @a.my_any?
      b2 = @a.any?

      expect(b1).to eq(b2)
    end
  end

  describe "#my_none?" do
    it "works as Enumerable#none?" do
      b = [nil, true, 99]

      a1 = @a.my_none? {|e| e.even?}
      a2 = @a.none? {|e| e.even?}

      expect(a1).to eq(a2)

      b1 = @a.my_none?
      b2 = @a.none?

      expect(b1).to eq(b2)
    end
  end

  describe "#my_count" do
    it "works as Enumerable#count" do
      a1 = @a.my_count {|e| e.even?}
      a2 = @a.count {|e| e.even?}

      expect(a1).to eq(a2)

      b1 = @a.my_count
      b2 = @a.count

      expect(b1).to eq(b2)

      c1 = @a.my_count(2)
      c2 = @a.count(2)

      expect(c1).to eq(c2)
    end
  end

  describe "#my_map" do
    it "works as Enumerable#map with proc" do
      proc = Proc.new { |i| i*i*i }

      a1 = @a.my_map { |i| i*i }
      a2 = @a.map { |i| i*i }

      expect(a1).to eq(a2)

      b1 = @a.my_map.class
      b2 = @a.map.class

      expect(b1).to eq(b2)

      c1 = @a.my_map(&proc)
      c2 = @a.map(&proc)

      expect(c1).to eq(c2)
    end
  end

  describe "#my_collect" do
    it "works as Enumerable#collect" do
      a1 = @a.my_collect { "cat"  }
      a2 = @a.collect { "cat"  }

      expect(a1).to eq(a2)

      b1 = @a.my_collect.class
      b2 = @a.collect.class

      expect(b1).to eq(b2)
    end
  end

  describe "#my_inject" do
    it "works as Enumerable#inject" do
      a1 = @a.my_inject { |sum, n| sum + n }
      a2 = @a.inject { |sum, n| sum + n }

      expect(a1).to eq(a2)

      b1 = @a.my_inject(1) { |product, n| product * n }
      b2 = @a.inject(1) { |product, n| product * n }

      expect(b1).to eq(b2)

      c1 = @a.my_inject(:+)
      c2 = @a.inject(:+)

      expect(c1).to eq(c2)

      d1 = @a.my_inject(1, :*)
      d2 = @a.inject(1, :*)

      expect(d1).to eq(d2)
    end
  end
end
