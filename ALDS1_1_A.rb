N = gets.to_i
A = gets.split(" ").map(&:to_i)
def insertionSort(a, n)
  for i in (0..(n-1))
    v = a[i]
    j = i - 1
    while j >= 0 && a[j] > v
      a[j+1] = a[j]
      j -= 1
    end
    a[j+1] = v
    puts a.join(" ")
  end
end

insertionSort(A, N)
