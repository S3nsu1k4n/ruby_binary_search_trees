# frozen_string_literal: true

require './lib/tree'

array = (1..7).to_a

tree = Tree.new(array)
tree.pretty_print

p tree.find(7)
tree.insert(0)

tree.pretty_print
