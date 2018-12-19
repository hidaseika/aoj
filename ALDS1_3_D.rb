ground = gets.split("")

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
# まだ途中
