# frozen_string_literal: true

# Handles the hashmap attributes
class HashMap
  LOAD_FACTOR = 0.75

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity, Array.new(2))
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = hash_code * prime_number + char.ord }

    p hash_code
  end

  def set(key, value)
    index = to_index(key)
    @buckets[index] = [key, value]
    p index
    p @buckets
  end

  def get(key)
    @buckets[to_index(key)][-1]
  end

  def has(key)
    @buckets.any? { |bucket| bucket[0] == key }
  end

  def length
    @buckets
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

puts test.get('food')
# puts test.has('drink')
# puts test.has('food')
