def caesar_cipher(message, shift)
  lowercase = ('a'..'z').to_a
  uppercase = ('A'..'z').to_a
  encoded_message = ''

  message.each_char do |char|
    if lowercase.include?(char)
      index = lowercase.index(char)
      index = (index + shift) % 26
      encoded_message += lowercase[index]
    elsif uppercase.include?(char)
      index = uppercase.index(char)
      index = (index + shift) % 26
      encoded_message += uppercase[index]
    else
      encoded_message += char
    end
  end

  encoded_message
end


encoded_message = caesar_cipher('What a string!', 5)
puts encoded_message
