# frozen_string_literal: true

require './linked_list'
require './hashmap'

# Similar to HashMaps but stores only keys
class HashSet < HashMap
  attr_reader :capacity

  def set(key)
    grow if needs_resize?

    index = to_index(key)
    bucket = @buckets[index]
    return bucket.replace(key) if has?(key)

    bucket.append(key)
    @num_of_entries += 1
  end
end

test = HashSet.new
puts test.capacity
test.set('green')
puts test.get('green')
puts test.has?('green')
