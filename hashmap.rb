# frozen_string_literal: true

require './linked_list'

# Handles the hashmap attributes
class HashMap
  LOAD_FACTOR = 0.75

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
    @entries = 0
  end

  # def set(key, value)
  #   index = to_index(key)
  #   bucket = @buckets[index]
  #   @entries += 1
  #   return bucket.replace([key, value]) if has?(key)

  #   bucket.append([key, value])
  # end

  # def grow; end

  def at_load_level?
    (length.to_f / @buckets.length) > 0.75
  end

  def entries
    # returns an array containing each key value pair
    @buckets.each_with_object([]) do |bucket, all_keys|
      all_keys.concat(bucket.entries) unless bucket.entries.nil?
    end
  end

  def keys
    # Returns an array containing all keys in the Hashmap
    @buckets.each_with_object([]) do |bucket, all_keys|
      all_keys.concat(bucket.keys) unless bucket.keys.nil?
    end
  end

  def values
    @buckets.each_with_object([]) do |bucket, all_keys|
      all_keys.concat(bucket.values) unless bucket.values.nil?
    end
  end

  def clear
    # Removes all entries from the HashMap
    @buckets = Array.new(@capacity) { LinkedList.new }
  end

  def length
    # @buckets.reduce(0) { |total_sum, bucket| total_sum + bucket.size }
    @entries
  end

  def remove(key)
    index = to_index(key)

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

puts test.set('Carlos', '17')
test.set('Carla', '21')
# puts test.get('food')
# puts test.get('drink')

# puts test.has?('food')
# puts test.has?('drink')
# puts test.has('drink')
# puts test.has('food')
# Linked list has to be modified to account for objects
# puts test.remove('food')
# puts test.remove('orange')
puts test.length
p test.keys
p test.values
p test.entries
p test.at_load_level?
