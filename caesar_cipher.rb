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

print 'Enter a string to encode: '
string = gets.chomp

print 'Enter the shift factor for the string: '
shift_factor = gets.chomp.to_i

caesar_cipher(string, shift_factor)
