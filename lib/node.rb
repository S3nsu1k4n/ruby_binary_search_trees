# frozen_string_literal: true

# node for the tree
class Node
  attr_accessor :left, :right, :data

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end
