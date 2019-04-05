n = gets.to_i

class Node
  attr_reader :id, :parent
  attr_accessor :children

  def initialize(id)
    @id = id
    @children = []
  end

  def parent=(parent)
    @parent = parent
    parent.children << self
  end

  def depth
    parent ? parent.depth + 1 : 0
  end

  def type
    if depth == 0
      "root"
    elsif children.length == 0
      "leaf"
    else
      "internal node"
    end
  end

  def parent_id
    (depth == 0) ? -1 : parent.id
  end
end

node_list = [] # [[0, 3, 1, 4, 10], [1, 2, 2, 3], [2, 0]]

n.times do
  node_list <<  gets.split(" ").map(&:to_i)
end

nodes = node_list.map { |n| Node.new(n[0]) } # [Node, Node ]
nodes.each_with_index do |node, i|
  child_id_list = node_list[i][2..-1]
  child_id_list.each do |child_id|
    child_node = nodes.find {|n| n.id == child_id}
    child_node.parent = node
  end
end

nodes.sort_by{|node| node.id}.each do |node|
  puts "node #{node.id}: parent = #{node.parent_id}, depth = #{node.depth}, #{node.type}, [#{node.children.map(&:id).join(", ")}]"
end
