# Sum
#
# Write an Array method, `sum`, that returns the sum of the elements in the
# array. You may assume that all of the elements are integers.

class Array
  def sum
    self.reduce(0, :+)
    
  end
end

# Square
#
# Write an array method, `square`, that returns a new array containing the
# squares of each element. You should also implement a "bang!" version of this
# method, which mutates the original array.

class Array
  def square!
    self.collect! do |value|
      value**2
    end
  end

  def square
    self.map do |value|
      value**2
    end
  end
end

# Finding Uniques
#
# Monkey-patch the Array class with your own `uniq` method, called
# `my_uniq`. The method should return the unique elements, in the order
# they first appeared:
#
# ```ruby
# [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# ```
#
# Do not use the built-in `uniq` method!

class Array
  def my_uniq
    output = []
    
    self.each do |value|
      output << value unless output.include?(value)
    end
    
    output
    
  end
end

# Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)

class Array
  def two_sum
    
    idx = 0
    output = []
    
    while idx < self.length - 1
      idy = idx + 1
      
      while idy < self.length
        output << [idx, idy].sort if self[idx] + self[idy] == 0
        
        idy+=1
      end
      
      idx +=1
      
    end


    output.sort! do |x,y| 
      if x[0] > y[0]
          1
      elsif x[0] < y[0]
          -1
      elsif x[1] > y[1]
          1
      elsif x[1] <y[1]
          -1
      else
          0
      end
    end

    output
  end

end

# Median
#
# Write a method that finds the median of a given array of integers. If
# the array has an odd number of integers, return the middle item from the
# sorted array. If the array has an even number of integers, return the
# average of the middle two items from the sorted array.

class Array
  def median
    
    if length == 0
      return nil
    end
    
    temp = self.dup.sort 
    
    l = temp.length
    
    if l % 2 == 0
      return (temp[l/2-1] + temp[l/2]).fdiv(2)
    else
      return temp[l/2]
    end
    
  end
end

# My Transpose
#
# To represent a *matrix*, or two-dimensional grid of numbers, we can
# write an array containing arrays which represent rows:
#
# ```ruby
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# ```
#
# We could equivalently have stored the matrix as an array of
# columns:
#
# ```ruby
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# ```
#
# Write a method, `my_transpose`, which will convert between the
# row-oriented and column-oriented representations. You may assume square
# matrices for simplicity's sake. Usage will look like the following:
#
# ```ruby
# matrix = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]
#
# matrix.my_transpose
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# ```
#
# Don't use the built-in `transpose` method!

class Array
  def my_transpose
    numRowsT = self[0].length
    numColsT = self.length
    output = Array.new(numRowsT) {|index| Array.new}
    
    self.each_with_index do |row, colIndT|
      row.each_with_index do |value, rowIndT|
        output[rowIndT] << value
      end
    end
    
    output

  end
  
end

# Bonus: Refactor your `Array#my_transpose` method to work with any rectangular
# matrix (not necessarily a square one).
