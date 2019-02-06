n = gets.to_i # 数列Aの長さ int
A = gets.split(" ").map(&:to_i) # 数列A [int] [1 5 7 10 21]
q = gets.to_i # 与えられる整数の個数 int
M = gets.split(" ").map(&:to_i) # q 個の整数 [int] [2 4 17 8]


def finded_match(array, m)
  if array.sum < m
    return false
  end
  array = array.select { |a| a <= m }
  (1..array.length).each do |i|
    if array.combination(i).to_a.map(&:sum).any? {|s| s == m}
      return true
    end
  end
  return false
end

M.each do |m|
  puts finded_match(A, m) ? "yes" : "no"
end
