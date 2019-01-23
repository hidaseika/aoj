g = gets.chomp.split("")

class Ground
  def initialize(ground)
    @str_ground = ground # ["/","/", "\"]
    @int_ground = to_i_array # [1, 2, 1]
  end

  def to_i_array
    h = 0
    @str_ground.map do |g|
      if g == "/"
	h += 1
      elsif g == "_"
	h
      elsif g == "\\"
	h -= 1
      end
    end.unshift(0)
  end

  def puddles
    peak_index = @int_ground.index(@int_ground.max)
    left_puddles = UpSlope.new(@int_ground[0..peak_index]).find_puddles
    right_puddles = DownSlope.new(@int_ground[peak_index..-1]).find_puddles

    left_puddles + right_puddles
  end
end

class DownSlope
  def initialize(int_ground)
    @upslope = UpSlope.new(int_ground.reverse)
  end

  def find_puddles
    @upslope.find_puddles.reverse
  end
end

class UpSlope
  def initialize(int_ground)
    @points = int_ground
  end

  def find_puddles
    puddles = []
    start = 0
    @points.each_with_index do |g, i|
      if i == 0
        # スキップ
        next
      elsif start != (i - 1) # startが固定されてる
        if @points[start] == g  # 終わり
          puddles << Puddle.new(@points[start..i])
          start = i
        end
      elsif @points[i-1] <= g  # 上りか平面
        start = i
      else # 初めて下りになった時
        # startを固定する
      end
    end
    puddles    # [Puddle(...), Puddle(..)]
  end
end

class Puddle
  attr_accessor :size

  def initialize(ground)
    @ground = ground
    @size = calculate_size
  end

  private

  # 真ん中でならす
  def calculate_size
    max = @ground.max
    max * @ground.size - @ground.sum
  end
end

ground = Ground.new(g)

sizes = ground.puddles.map(&:size)
kosu = sizes.length

puts sizes.sum
puts ([kosu] + sizes).join(" ")
