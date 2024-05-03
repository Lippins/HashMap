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

  def keys
    entries
  end

  def values
    entries
  end
end
