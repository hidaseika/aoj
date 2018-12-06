N = gets.to_i
A = gets.split(" ").map(&:to_i)
change_count = 0
def selectionSort(a, n, change_count)
  for i in (0..(n-1)).to_a
    minj = i
    for j in (i..(n-1)).to_a
      if a[j] < a[minj]
        minj = j
      end
    end
    if a[i] != a[minj]
      karinobasyo = a[i]
      a[i] = a[minj]
      a[minj] = karinobasyo
      change_count += 1
    end
  end
  return change_count
end

change_count = selectionSort(A, N, change_count)

puts A.join(" ")
puts change_count
