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

  def two_vertex_to_five
    v1 = @start_vertex
    v5 = @end_vertex
    v2 = (v1 * 2 + v5) / 3
    v4 = (v1 + v5 * 2) / 3
    v3 = v2 + (v4 - v2).rotate(Math::PI / 3)
    [v1,v2,v3,v4,v5]
  end

  # [Edge, Edge, Edge, Edge, Edge]
  def divide
    vertexes = two_vertex_to_five
    vertexes[0..-2].zip(vertexes[1..-1]).map {|v1, v2| Edge.new(v1, v2)}
  end
end


class KochCurve
  def initialize(n)
    @n = n
    @edges = [Edge.new(Vertex.new(0, 0), Vertex.new(100, 0))]
    create_koch_curve
  end

  def create_koch_curve
    @n.times do
      @edges = @edges.map(&:divide).flatten
    end
    @edges
  end

  def vertexes # [Vertex, Vertex, ]
    @edges.map {|edge| edge.start_vertex} + [Vertex.new(100, 0)]
  end
end

koch_curve = KochCurve.new(N)
koch_curve.vertexes.each do |vertex|
  puts "#{vertex.x} #{vertex.y}"
end
