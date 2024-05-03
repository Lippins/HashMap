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
      return return_value(current_node.data) if match_key?(current_node.data, key)

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

    if match_key?(@head.data, key)
      value = return_value(@head.data)
      @head = @head.next
      return value
    end

    current_node = @head
    current_node = current_node.next until current_node.next.nil? || match_key?(current_node.next.data, key)

    if current_node.next && match_key?(current_node.next.data, key)
      value = return_value(current_node.next.data)
      current_node.next = current_node.next.next
      return value
    end

    nil
  end

  def match_key?(data, key)
    # Handles preferential matching for either HashSets or HashMaps
    data.is_a?(Array) ? data[0] == key : data == key
  end

  def return_value(data)
    # Handles value returns for either HashSets or HashMaps
    data.is_a?(Array) ? data[-1] : data
  end
end
