=begin
Determine whether an integer is a palindrome. Do this without extra space.
=end

# @param {Integer} x
# @return {Boolean}

# 只 loop integer 長度的一半，依序比對第一＆最後，第二＆倒數第二...，如果有不相等的就直接 return false。
def is_palindrome(x)
  return false if x < 0

  chars = x.to_s.chars
  length = chars.length
  result = true

  for i in 0..((length / 2.0).ceil - 1) do
    if chars[i] == chars[length - 1 - i]
      next
    else
      result = false
      break
    end
  end
  result
end
