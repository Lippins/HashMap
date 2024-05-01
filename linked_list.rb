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

  def at(index)
    # returns the node at the given index
    current_node = @head
    index.times { |_i| current_node = current_node.next }
    current_node
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

  def prepend(value)
    # adds a new node containing value to the start of the list
    new_head = Node.new(value)
    new_head.next = @head unless @head.nil?
    @head = new_head
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

  def pop
    # removes the last element from the list
    return if head.nil?

    if @head.next.nil?
      popped_node = @head
      @head = nil
    else
      current_node = @head
      current_node = current_node.next until current_node.next.next.nil?
      popped_node = current_node.next
      current_node.next = nil
    end

    popped_node
  end

  def shift
    # removes the first element from the list
    return if @head.nil?

    previous_head = @head
    @head = @head.next
    previous_head.next = nil
    previous_head
  end

  def contains?(value)
    # returns true if the passed in value is in the list and otherwise returns false.
    current_node = @head
    until current_node.nil?
      return true if current_node.data == value

      current_node = current_node.next
    end
    false
  end

  def find(key)
    # returns the index of the node containing value, or nil if not found.
    current_node = @head
    while current_node
      return current_node.data[-1] if current_node.data[0] == key

      current_node = current_node.next
    end
    'nil'
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

  def insert_at(value, index)
    # inserts a new node with the provided value at the given index.
    return prepend(value) if index.zero?
    return puts "Index #{index} is out of bounds." if index >= size || index.negative?

    current_node = @head

    (index - 1).times { |_i| current_node = current_node.next if current_node.next }

    new_node = Node.new(value)
    new_node.next = current_node.next
    current_node.next = new_node
  end

  def remove(key)
    return 'nil' if head.nil?

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

    'nil'
  end
end
