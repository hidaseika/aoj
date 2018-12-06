class Card
  def initialize(card)
    @mark = card[0]
    @number = card[1].to_i
  end

  def mark
    @mark
  end

  def number
    @number
  end

  def to_s
    @mark + @number.to_s
  end
end

N = gets.to_i
C = gets.split(" ").map{ |c| Card.new(c) }

def stableSort(c, n)
  sorted_b = bubleSort(c, n).map(&:to_s)
  sorted_s = selectionSort(c, n).map(&:to_s)
  puts sorted_b.join(" ")
  puts "Stable"
  puts sorted_s.join(" ")
  puts (sorted_b == sorted_s ? "Stable" : "Not stable")
end

def selectionSort(a, n)
  a = a.clone
  for i in (0..(n-1)).to_a
    minj = i
    for j in (i..(n-1)).to_a
      if a[j].number < a[minj].number
	minj = j
      end
    end
    if a[i] != a[minj]
      karinobasyo = a[i]
      a[i] = a[minj]
      a[minj] = karinobasyo
    end
  end
  return a
end

def bubleSort(a, n)
  a = a.clone
  flag = 1
  while flag == 1
    flag = 0
    for j in (1..n-1).to_a.reverse
      if a[j].number < a[j-1].number
        karinotoko = a[j]
        a[j] = a[j-1]
        a[j-1] = karinotoko
        flag = 1
      end
    end
  end
  return a
end

stableSort(C, N)
