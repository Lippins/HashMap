# frozen_string_literal: true

require './linked_list'
require './hashmap'

# Similar to HashMaps but stores only keys
class HashSet < HashMap
  attr_reader :capacity

  def set(key)
    grow if needs_resize?
    return if has?(key)

    index = to_index(key)
    bucket = @buckets[index]

    bucket.append(key)
    @num_of_entries += 1
  end

  def copy_entries_to(new_buckets)
    # Copies over entries from older HashSet to a new one
    @buckets.each do |bucket|
      current_node = bucket.head
      while current_node
        new_index = to_index(current_node.data)
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
          print "#{current_node.data}"
          current_node = current_node.next
          print ' -> ' unless current_node.nil?
        end
        puts '' # New line after each bucket
      end
    end
    puts "#{length} entries in total"
  end

  def keys
    entries
  end

  def values
    entries
  end
end
