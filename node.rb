# frozen_string_literal: true

# Defines the attributes of a node -- data and pointer
class Node
  attr_accessor :data, :next

  def initialize(data = nil, next_node = nil)
    @data = data
    @next = next_node
  end
end
