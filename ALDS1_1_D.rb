n = gets.to_i

x = gets.to_i
min = x
max = -(10**9)

(n - 1).times do
  x = gets.to_i
  if max < x - min
    max = x - min
  end
  if min > x
    min = x
  end
end

puts max
