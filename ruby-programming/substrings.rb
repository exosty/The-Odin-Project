def substrings(string, dictionary)
  string.downcase!
  hash = Hash.new
  dictionary.each do |word|
    hash[word]=string.scan(word).size if string.scan(word).size>0
  end
  p hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)
