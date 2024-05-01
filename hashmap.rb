# frozen_string_literal: true

require './linked_list'

# Handles the hashmap attributes
class HashMap
  LOAD_FACTOR = 0.75

  def initialize
    @capacity = 16
    @buckets = Array.new(@capacity) { LinkedList.new }
    @num_of_entries = 0
  end

  def set(key, value)
    grow if needs_resize?

    index = to_index(key)
    bucket = @buckets[index]
    return bucket.replace([key, value]) if has?(key)

    bucket.append([key, value])
    @num_of_entries += 1
  end

  def grow
    # Grows bucket size
    @capacity *= 2
    new_buckets = Array.new(@capacity) { LinkedList.new }

    @buckets = copy_entries_to(new_buckets)
  end

  def copy_entries_to(new_buckets)
    # Copies over entries from older HashMap to a new one
    @buckets.each do |bucket|
      current_node = bucket.head
      while current_node
        new_index = to_index(current_node.data[0])
        new_buckets[new_index].append(current_node.data)
        current_node = current_node.next
      end
    end
    new_buckets
  end

  def pretty_print
    @buckets.each_with_index do |bucket, index|
      print "🪣 Bucket #{index}: "
      if bucket.head.nil?
        puts 'empty'
      else
        current_node = bucket.head
        while current_node
          print "[#{current_node.data[0]}: #{current_node.data[1]}]"
          current_node = current_node.next
          print ' -> ' unless current_node.nil?
        end
        puts '' # New line after each bucket
      end
    end
  end

  def needs_resize?
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
    # Returns an array containing all values in the Hashmap
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
    @num_of_entries
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

puts test.set('Siju', '29')
test.set('Tito', '31')
test.set('Sarah', '29')
test.set('Israel', '29')
p test.needs_resize?
test.set('Shola', '30')
test.set('Pheekun', '30')
test.set('Nath', '37')
test.set('Ameenah', '35')
p test.needs_resize?
test.set('Ameenah', '40')
test.set('Rahmat', '10')
p test.needs_resize?
test.set('Sydney', '12')
test.set('Luckey', '18')
test.set('Jide', '18')
test.set('Shopify', '18')
test.set('Amazon', '18')
test.set('Gelato', '18')
test.set('Squarespace', '18')
test.set('Square', '18')
puts test.get('food')
puts test.get('drink')

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
p test.needs_resize?
test.pretty_print
