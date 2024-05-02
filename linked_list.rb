# frozen_string_literal: true

require './node'

# Handles the actual linked list objects
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    # returns the last node in the list
    current_node = @head
    current_node = current_node.next until current_node.next.nil?
    current_node
  end

  def replace(value)
    current_node = @head
    current_node = current_node.next until current_node.data[0] == value[0]
    current_node.data = value
  end

  def append(value)
    # adds a new node containing value to the end of the list
    if @head.nil?
      @head = Node.new(value)
    else
      current_node = @head
      current_node = current_node.next until current_node.next.nil?
      current_node.next = Node.new(value)
    end
  end

  def to_s
    # present the linked list as string format: ( value ) -> ( value ) -> ( value ) -> nil
    current_node = @head
    result = ''
    until current_node.nil?
      result += "( #{current_node.data} ) -> "
      current_node = current_node.next
    end
    "#{result}nil"
  end

  def entries
    entry_list = []
    return if @head.nil?

    current_node = @head
    until current_node.nil?
      entry_list << current_node.data
      current_node = current_node.next
    end
    entry_list
  end

  def values
    values_list = []
    return if @head.nil?

    current_node = @head
    until current_node.nil?
      values_list << current_node.data[-1]
      current_node = current_node.next
    end
    values_list
  end

  def keys
    key_list = []
    return if @head.nil?

    current_node = @head
    until current_node.nil?
      key_list << current_node.data[0]
      current_node = current_node.next
    end
    key_list
  end

  def find(key)
    current_node = @head
    while current_node
      return current_node.data[-1] if current_node.data[0] == key

      current_node = current_node.next
    end
    nil
  end

  def size
    # returns the total number of nodes in the list
    counter = 0
    current_node = @head
    until current_node.nil?
      counter += 1
      current_node = current_node.next
    end
    counter
  end

  def remove(key)
    return nil if head.nil?

    if @head.data[0] == key
      value = @head.data[-1]
      @head = @head.next
      return value
    end

    current_node = @head

    current_node = current_node.next until current_node.next && current_node.next.data[0] == key

    if current_node.next && current_node.next.data[0] == key
      value = current_node.next.data[0]
      current_node.next = current_node.next.next
      return value
    end

    nil
  end
end
