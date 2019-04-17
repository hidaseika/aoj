class NilClass
  def preorder
    nil
  end

  def inorder
    nil
  end

  def postorder
    nil
  end

  def parent=(_)
    nil
  end
end

class Node
  attr_reader :id
  attr_accessor :left_child, :right_child, :parent

  def initialize(id)
    @id = id
    @left_child = nil
    @right_child = nil
    @parent = nil
  end

  def preorder
    [@id, @left_child.preorder, @right_child.preorder].flatten.compact
  end

  def inorder
    [@left_child.inorder, @id, @right_child.inorder].flatten.compact
  end

  def postorder
    [@left_child.postorder, @right_child.postorder, @id].flatten.compact
  end

  def print_preorder
    puts "Preorder"
    puts " #{preorder.join(" ")}"
  end

  def print_inorder
    puts "Inorder"
    puts " #{inorder.join(" ")}"
  end

  def print_postorder
    puts "Postorder"
    puts " #{postorder.join(" ")}"
  end
end

n = gets.to_i
node_ids = []
n.times do
  node_ids << gets.chomp.split(' ').map(&:to_i)
end
nodes = node_ids.map { |id_list| Node.new(id_list.first) }

node_ids.each do |id, left_child_id, right_child_id|
  node = nodes.find{|node| node.id == id }
  node.left_child = nodes.find{|node| node.id == left_child_id}
  node.right_child = nodes.find{|node| node.id == right_child_id}
  node.left_child.parent = node
  node.right_child.parent = node
end

root = nodes.find { |node| !node.parent }
root.print_preorder
root.print_inorder
root.print_postorder
