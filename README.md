# HashMap and HashSet Implementation in Ruby

This project includes custom implementations of a `HashMap` and `HashSet` in Ruby. The `HashMap` allows for storing key-value pairs with efficient lookup, insertion, and deletion operations. The `HashSet`, derived from the `HashMap`, manages unique elements without storing associated values.

## Features

- Custom hash function for string keys.
- Handling of collisions using chaining.
- Dynamic resizing of the hash map based on a set load factor of `0.75`.
- Complete suite of methods including set, get, has, remove, and more.

## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/Lippins/HashMap.git
cd HashMap
```

## Usage

Below are examples of how to use the `HashMap` and `HashSet` classes.

### HashMap

```ruby
require_relative 'hashmap'

hash_map = HashMap.new
hash_map.set("Carlos", "I am the old value.")
hash_map.set("Carlos", "I am the new value.") # Overwrites the old value

value = hash_map.get("Carlos") # Returns "I am the new value."
puts value

hash_map.remove("Carlos") # Removes Carlos from the map and returns the value
```

### HashSet

```ruby
require_relative 'hashset'

hash_set = HashSet.new
hash_set.add("test")
puts hash_set.has?("test") # Returns true
hash_set.remove("test") # Removes "test" from the set
```

## Methods

### HashMap

- `set(key, value)`: Adds or updates a key with the specified value.
- `get(key)`: Retrieves the value for a given key; returns nil if the key does not exist.
- `has?(key)`: Returns true if the key exists in the hash map; otherwise, returns false.
- `remove(key)`: Removes a key from the map and returns its value; returns nil if the key does not exist.
- `length`: Returns the number of key-value pairs stored in the hash map.
- `clear`: Removes all entries from the hash map.
- `keys`: Returns an array of all keys in the map.
- `values`: Returns an array of all values in the map.
- `entries`: Returns an array of [key, value] pairs.

### HashSet

- `add(key)`: Adds a key to the set.
- `has?(key)`: Checks if a key exists in the set.
- `remove(key)`: Removes a key from the set.

### Additional Method

#### Pretty Print

The `pretty_print` method is helpful for visually displaying the contents of the hash map in a readable and structured format. This method iterates over each bucket in the hash map, listing the keys and their corresponding values. It's useful for debugging purposes to quickly view all entries within the hash map.

#### Usage of `pretty_print`

```ruby
# Assuming the HashMap class and an instance have been created
# Let's take a nested array of 20 shopping carts and their creation dates

carts = [['Shopify', 2006], ['Magento', 2008], ['WooCommerce', 2011], ['BigCommerce', 2009], ['PrestaShop', 2007], ['OpenCart', 1998],
            ['Zen Cart', 2003], ['osCommerce', 2000], ['Square Online', 2009], ['Wix Stores', 2006], ['Ecwid', 2009], ['Volusion', 1999], ['3dCart', 1997],
            ['Big Cartel', 2005], ['Shopware', 2000], ['Salesforce Commerce Cloud', 1999], ['X-Cart', 2000], ['Miva', 1997], ['CS-Cart', 2005],
            ['E-junkie', 2003]]

carts.each { |key, value| hash_map.set(key, value) }

hash_map.pretty_print
```

#### Expected Output

When you call `pretty_print`, the output will show how each bucket in the hash map is populated:

```bash
🪣 Bucket 0: empty
🪣 Bucket 1: empty
🪣 Bucket 2: empty
🪣 Bucket 3: empty
...
🪣 Bucket 6: [Shopify: 2006]
🪣 Bucket 7: [Big Cartel: 2005] -> [Miva: 1997]
...
🪣 Bucket 23: [Magento: 2008] -> [Volusion: 1999]
...
🪣 Bucket 31: [osCommerce: 2000]
20 entries in total
```

#### Note:

The pretty_print method's output can significantly help debugging by showing the exact distribution of entries across the hash map's buckets, highlighting any patterns or irregularities in data placement that could affect performance.

## Languages

- Ruby
