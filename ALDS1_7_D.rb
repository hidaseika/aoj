class NilClass
  def postorder
    nil
  end
end

class Node
  attr_accessor :id, :left_child, :right_child

  def initialize(id)
    @id = id
    @left_child = nil
    @right_child = nil
  end

  def postorder
    [@left_child.postorder, @right_child.postorder, @id].flatten.compact
  end

  def print_postorder
    puts postorder.join(" ")
  end
end

class TreeConstructor
  attr_accessor :root

  def initialize(preorder, inorder)
    if !preorder[0]
      return
    end

    @root = Node.new(preorder[0])

    inorder_right = inorder[(inorder.index(@root.id) + 1)..-1]
    inorder_left = inorder - [@root.id] - inorder_right
    preorder_right = preorder.reject { |item| [@root.id, *inorder_left].include? item }
    preorder_left = preorder - [@root.id] - preorder_right

    @root.left_child = TreeConstructor.new(preorder_left, inorder_left).root
    @root.right_child = TreeConstructor.new(preorder_right, inorder_right).root
  end
end

n = gets.to_i
preorder = gets.split(" ").map(&:to_i)
inorder = gets.split(" ").map(&:to_i)

tree_constructor = TreeConstructor.new(preorder, inorder)
root = tree_constructor.root
root.print_postorder
