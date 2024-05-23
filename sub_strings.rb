# frozen_string_literal: true

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(find, dictionary)
  find = find.split(' ')
  array = []
  dictionary.each do |word|
    find.each do |substr|
      array.push(word) if substr.include?(word)
    end
  end
  array.each_with_object(Hash.new(0)) do |count, result|
    result[count] += 1
  end
end

puts substrings('below', dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
