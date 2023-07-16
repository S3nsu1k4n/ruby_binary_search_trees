# frozen_string_literal: true

require './lib/node'

# binary tree
class Tree
  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree @array
  end

  # turn array into balanced binary tree full of "Nodes" appropiatetly placed
  # sort + remove duplicates
  # return -> level 0 root node
  def build_tree(array)
    return nil if array.empty?

    mid = (array.size - 1) / 2
    root_node = Node.new(array[mid])

    root_node.left = build_tree(array[0...mid])
    root_node.right = build_tree(array[mid + 1..-1])

    root_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # insert the given value
  def insert(value, node = @root)
    return node if node.nil? || node.data == value

    # go left
    if value < node.data
      return insert(value, node.left) unless node.left.nil?

      node.left = Node.new(value)
    # go right
    else
      return insert(value, node.right) unless node.right.nil?

      node.right = Node.new(value)
    end
    node
  end

  # delete the given value
  def delete(value, node = @root)
    return node if node.nil?

    if !node.left.nil? && node.left.data == value
      node2delete = node.left
      node.left = node2delete.left.nil? ? node2delete.right : node2delete.left
      return node
    elsif !node.right.nil? && node.right.data == value
      node2delete = node.right
      node.right = node2delete.left.nil? ? node2delete.right : node2delete.left
      return node
    end

    # go left
    return delete(value, node.left) if value < node.data

    # go right
    delete(value, node.right)
  end

  # return the node with the given value
  def find(value)
    find_node(value)
  end

  def find_node(value, node = @root)
    return node if node.nil? || node.data == value
    # go left
    return find_node(value, node.left) if value < node.data

    # go right
    find_node(value, node.right)
  end

  # accepts a block
  # traverse the tree in breadth-first level order
  # yield each node to the provided block
  def level_order; end

  # all 3:
  # accepts a block
  # traverse the tree in their respective depth-first order
  # yield each node to the provided block
  # method returns an array of values if no block is given
  def inorder; end

  def preorder; end

  def postorder; end

  # return height of the node
  # height = number of edges in longest path from a given node to a leaf node
  def height(node); end

  # return depth of the node
  # depth = number of edges in a path from a given node to a the tree's root node
  def depth(node); end

  # checks if the tree is balanced
  # balanced = difference between heights of left and right subtree of every node is not more than 1
  def balanced?; end

  # rebalances an unbalanced tree
  def rebalance; end
end
