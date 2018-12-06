n = gets.to_i

def isPrimary(x)
  sqrt = Math.sqrt(x)
  (x == 2) || (x == 3) || (2..sqrt)
                .to_a
                .reject {|i| i > 2 && (i % 2 == 0)}
                .all? {|i| x % i != 0}
end

primaries_count = 0

n.times do
  if isPrimary(gets.to_i)
    primaries_count += 1
  end
end

puts primaries_count
