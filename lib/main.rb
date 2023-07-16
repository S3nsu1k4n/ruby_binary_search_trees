# frozen_string_literal: true

require './lib/tree'

array = (1..14).to_a

tree = Tree.new(array)
tree.pretty_print

p tree.find(7)
tree.insert(0)

tree.pretty_print

#tree.delete(3)

tree.pretty_print