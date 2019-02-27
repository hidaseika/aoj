N = gets.to_i


class Vertex
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x.to_f
    @y = y.to_f
  end

  # -v1
  def -@
    Vertex.new(@x * (-1), @y * (-1))
  end

  # v1 + v2
  def +(v)
    Vertex.new((@x + v.x), (@y + v.y))
  end

  # v1 - v2
  def -(v)
    Vertex.new((@x - v.x), (@y - v.y))
  end

  # v1 * 2
  def *(i)
    Vertex.new(@x * i, @y * i)
  end

  # v1 / 3
  def /(i)
    Vertex.new(@x / i, @y / i)
  end

  def rotate(rad)
    Vertex.new(Math.cos(rad) * @x - Math.sin(rad) * @y,
               Math.sin(rad) * @x + Math.cos(rad) * @y)
  end
end

class Edge
  attr_accessor :start_vertex, :end_vertex
  def initialize(start_vertex, end_vertex)
    @start_vertex = start_vertex
    @end_vertex = end_vertex
  end

  def two_vertex_to_five(edge)
    v1 = edge.start_vertex
    v5 = edge.end_vertex
    v2 = (v1 * 2 + v5) / 3
    v4 = (v1 + v5 * 2) / 3
    v3 = v2 + (v4 - v2).rotate(Math::PI / 3)
    [v1,v2,v3,v4,v5]
  end
end


class KochCurve
  def initialize(n)
    @n = n
  end

  def create_koch_curve
    # 続きはここから考える
    first_edge = Edge.new(Vertex.new(0, 0), Vertex.new(100, 0))
    koch_curves = [first_edge]
    
  end

  def vertexes # [Vertex, Vertex, ]
    create_koch_curve
  end

  
end

koch_curves.vertexes.each do |vertex|
  puts "#{vertex.x} #{vertex.y}"
end
