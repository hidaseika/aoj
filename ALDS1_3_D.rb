g = gets.chomp.split("")

class Ground
  def initialize(ground)
    @str_ground = ground # ["/","/", "\"]
    @int_ground = to_i_array # [1, 2, 1]
    @str_int_ground = @str_ground.zip(@int_ground) # [ ["/", 1], ["/", 2], ["\", 1] ]
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
    end
  end

  def parsed_ground
    parsed_ground = []
    peak_index = @int_ground.index(@int_ground.max)
    left_ground = @str_int_ground[0..peak_index]
    right_ground = @str_ground[(peak_index + 1)..-1].map{|g| {"/" => "\\", "\\" => "/", "_" => "_"}[g]}.zip(@int_ground[peak_index..-2]).reverse

    parsed_ground += find_puddles(left_ground)
    parsed_ground += find_puddles(right_ground).reverse
    parsed_ground
  end

  def find_puddles(ground)
    parsed_ground = []
    start_g = nil
    ground.each_with_index do |g, i|
      start_g ||= {ground: g, index: i} if g[0] == "\\" # start_g {ground: ["/", 1], index: 1}
      
      if start_g != nil  && start_g[:ground][1] + 1 == g[1] && start_g[:index] != i
        end_g = {ground: g, index: i}
        parsed_ground << ground[start_g[:index]..end_g[:index]]
        start_g = nil
        end_g = nil
      end
    end

    parsed_ground # ["/", "/", "\"]
  end
end

class Puddle
  attr_accessor :size

  def initialize(ground)
    @ground = ground
    @size = calculate_size
  end

  private
  def calculate_size
    y = 0
    size = 0
    for g in @ground do
      if g[0] == "_"
        size += y
      elsif g[0] == "\\"
        y += 1
        size += ( 0.5 + y - 1 )
      else
        size += ( 0.5 + y - 1 )
        y -= 1
      end
    end
    size.to_i
  end
end

ground = Ground.new(g)

sizes = ground.parsed_ground.map {|pg| Puddle.new(pg).size}
kosu = sizes.length

puts sizes.sum
puts ([kosu] + sizes).join(" ")
