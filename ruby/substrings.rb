
  def substrings(str, dictionary)

    substring_hash = Hash.new(0)

    dictionary.each do |word| 
        if str.include?(word)
         substring_hash[word] += 1
        end

    end

    return substring_hash


  end
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  subs = substrings("below",dictionary)
  puts subs
