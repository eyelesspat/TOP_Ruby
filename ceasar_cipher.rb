def caesar_cipher(string, shift_factor)
  array = string.split('').map!(&:ord).map! do |number|
    if number.between?(65, 90)
      number + shift_factor <= 90 ? (number + shift_factor) : number - 26 + shift_factor
    elsif number.between?(97, 122)
      number + shift_factor <= 122 ? (number + shift_factor) : number - 26 + shift_factor
    else
      number
    end
  end
  puts array.map(&:chr).join
end

caesar_cipher('What a string!', 5)
