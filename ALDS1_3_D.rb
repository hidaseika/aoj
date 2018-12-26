ground = gets.split("")
h = 0
ground = ground.map do |g|
  if g == "/"
    h += 1
  elsif g == "_"
    h
  else
    h -= 1
  end
end

print ground
# \\///\_/\/\\\\/_/\\///__\\\_\\/_\/_/\
# [-1, -2, -1, 0, 1, 0, 0, 1, 0, 1, 0, -1, -2, -3, -2, -2, -1, -2, -3, -2, -1, 0, 0, 0, -1, -2, -3, -3, -4, -5, -4, -4, -5, -4, -4, -3, -4, -5]

class Puddle
  attr_accessor :size

  def initialize(ground)
    @size = calculate_size(this.ground)
  end

  private
  def calculate_size(ground)
    y = 0
    for g in ground do
      if g == "_"
        @size += y
      else
        @size += ( 0.5 + y - 1 )
        y += ( g == "/" ? 1 : -1 )
      end
    end
  end
end
