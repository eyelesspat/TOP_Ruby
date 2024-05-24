# frozen_string_literal: true

def stock_picker(array)
  lowest = array[0]
  lowest_index = 0
  profit = 0
  result = []
  array.each_with_index do |number, index|
    if number < lowest
      lowest = number
      lowest_index = index
    end

    if number - lowest > profit
      profit = number - lowest
      result = [lowest_index, index]
    end
  end
  result
end

print stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
# [1,4]  for a profit of $15 - $3 == $12
