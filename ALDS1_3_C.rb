n = gets.to_i
list = []

def ListOperation(list, command, num)
  case command
  when "insert"
    list.unshift(num)
  when "delete"
    list.each_with_index do |x, i|
      if x == num
        list.delete_at(i)
        break
      end
    end
  when "deleteFirst"
    list.delete_at(0)
  when "deleteLast"
    list.pop
  end
  return list
end

n.times do
  command, num  = gets.split(" ")
  list = ListOperation(list, command, num)
end

puts list.join(" ")
