class LCSMeter
  def initialize(x, y)
    @x = x.split("")
    @y = y.split("")
    @max_size_table = {}
  end

  def get_length
    calc(0, 0)
  end

  def calc(x_index, y_index)
    @max_size_table[x_index] ||= {}
    y_subpart = @y[y_index..-1]
    if x_index >= @x.length
      return 0
    end
    @max_size_table[x_index][y_index] ||= (
      if !y_subpart.index(@x[x_index])
        calc(x_index + 1, y_index)
      else
        n = y_subpart.index(@x[x_index]) + y_index + 1
        [calc(x_index + 1, y_index), calc(x_index + 1, n) + 1].max
      end
    )
  end
end

q = gets.to_i
q.times do
  x = gets.strip
  y = gets.strip
  meter = LCSMeter.new(x, y)
  puts meter.get_length
end
