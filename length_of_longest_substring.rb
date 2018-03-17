=begin
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end


# @param {String} s
# @return {Integer}

# 這個解法為 O(n^2)，當有很長的 pattern 的字串重複很多次的話在時間上就會炸掉。
def length_of_longest_substring(s)
  length = s.length
  res = []

  for i in 0..(length - 1) do
    check = []
    for j in i..(length - 1) do
      check.include?(s[j]) ? break : (check << s[j])
    end
    res << check.length
  end
  res.sort.pop || 0
end

# 這次的解法參考了一下別人的想法，主要是將 loop 過的字元與其對應的 index 儲存在 hash 裡面，
# 當往後抓字元的時候可以使用 hash 來比對這個字元是否出現過，如果有的話就將算總長度的 start_index
# 換成重複過的那個字元的 index。這樣的做法就不用跑兩次迴圈了，時間上可以節省很多。
def length_of_longest_substring(s)
  max = 0
  char_to_index_map = {}
  start_index = -1

  s.chars.each_with_index do |c, i|
    current_index = char_to_index_map[c]
    if current_index && current_index > start_index
      start_index = char_to_index_map[c]
    end

    char_to_index_map[c] = i
    new_length = i - start_index
    max = new_length if new_length > max
  end
end
