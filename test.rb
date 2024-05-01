# frozen_string_literal: true

require './linked_list'

# Handles the hashmap attributes
class HashMap
  LOAD_FACTOR = 0.75

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def set(key, value)
    index = to_index(key)
    @buckets[index].append([key, value])
    p index
    p @buckets
  end

  def length
    @buckets.length
  end

  def remove(key)
    index = to_index(key)
    return 'nil' if length <= index

    @buckets[index].remove(key)
  end

  def has?(key)
    get(key) != 'nil'
  end

  def get(key)
    @buckets[to_index(key)].find(key)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = hash_code * prime_number + char.ord }

    p hash_code
  end

  def check_index(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end

  def to_index(key)
    hash(key) % @capacity
  end
end

test = HashMap.new

test.set('food', '23')
test.set('drink', '4')
# puts test.get('food')
# puts test.get('drink')

# puts test.has?('food')
# puts test.has?('drink')
# puts test.has('drink')
# puts test.has('food')
# Linked list has to be modified to account for objects
puts test.remove('food')
puts test.remove('orange')
puts test.length
