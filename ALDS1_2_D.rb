n = gets.to_i
numbers = []

n.times do
  numbers << gets.to_i
end

def insertionSort(a, n, g, cnt)
  for i in (g..(n-1))
    v = a[i]
    j = i - g
    while j >= 0 && a[j] > v
      a[j+g] = a[j]
      j -= g
      cnt += 1
    end
    a[j+g] = v
  end
  return cnt
end

def shellSort(numbers, n)
  garray = g(n)
  m = garray.length
  cnt = 0
  for i in (0..(m-1))
    cnt = insertionSort(numbers, n, garray[i], cnt)
  end
  puts m
  puts garray.join(" ")
  puts cnt
  puts numbers
end

def g(n)
  x = 1
  g = []
  while true
    g << x
    x = 3 * x + 1
    if n <= x
      break
    end
  end
  g.reverse
end

shellSort(numbers, n)
