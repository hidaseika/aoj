x, y = gets.split(" ").map(&:to_i)

def gcd(x, y)
  if x >= y
    if x % y == 0
      return y
    else
      gcd(y, (x % y))
    end
  else
    gcd(y, x)
  end
end

puts gcd(x, y)
