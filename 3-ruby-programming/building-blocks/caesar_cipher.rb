string = ARGV[0].dup # :dup here to not to get frozen string, so we could modify it later with :gsub!
key =  ARGV[1].to_i

string.gsub!(/[a-z]/) {|c| (c.ord + key)>122 ? (c.ord + key - 26).chr.to_s : (c.ord + key).chr.to_s}
string.gsub!(/[A-Z]/) {|c| (c.ord + key)>90 ? (c.ord + key - 26).chr.to_s : (c.ord + key).chr.to_s}
p string
