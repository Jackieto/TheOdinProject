def substrings(str, dictionary)
  substring_hash = Hash.new(0)

  dictionary.each do |word|
    substring_hash[word] += 1 if str.include?(word)
  end

  substring_hash
end
dictionary = %w[below down go going horn how howdy it i low own part partner
                sit]
subs = substrings('below', dictionary)
puts subs
