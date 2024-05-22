def caesar_cipher(string, shift_factor)
  array = string.split('')

  array.map!(&:ord)

  array.map! do |number|
    if number >= 65 && number <= 90
      if number + shift_factor <= 90
        number + shift_factor
      else
        number - 26 + shift_factor
      end

    elsif number >= 97 && number <= 122
      if number + shift_factor <= 122
        number + shift_factor
      else
        number - 26 + shift_factor
      end
    else
      number
    end
  end
  final_array = array.map(&:chr)
  final_array = final_array.join
  puts final_array
end

caesar_cipher('What a string!', 5)
