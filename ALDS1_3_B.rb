n, q = gets.split(" ").map(&:to_i)

processes = []

n.times do
  name, time = gets.split(" ")
  processes << Processs.new(name, time)
end

class Processs
  attr_accessor :name, :time
  
  def initialize(name, time)
    @name = name
    @time = time.to_i
  end
end

class RoundRobinScheduling
  def initialize(processes, quantum)
    @processes = processes
    @quantum = quantum
    @total_time = 0
  end

  def execute
    while @processes.length > 0 do
      process = @processes.shift
      if process.time <= @quantum
        @total_time += process.time
        puts "#{process.name} #{@total_time}"
      else
        @total_time += @quantum
        process.time -= @quantum
        @processes << process
      end
    end
  end
end

queue = RoundRobinScheduling.new(processes, q)
queue.execute
