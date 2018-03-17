=begin
Given a 32-bit signed integer, reverse digits of an integer.

Example 1:
Input: 123
Output:  321

Example 2:
Input: -123
Output: -321

Example 3:
Input: 120
Output: 21

Note:
Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
=end

# @param {Integer} x
# @return {Integer}

def reverse(x)
  negative = true if x < 0
  reversed_integer = x.to_s.reverse.to_i
  reversed_integer = - reversed_integer if negative
  reversed_integer.bit_length < 32 ? reversed_integer : 0
end
