require_relative 'lib/hash_map'
require_relative 'lib/linked_list'
require_relative 'lib/node'

test = HashMap.new


test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts test
puts "Length is currently #{test.length}, capacity is currently #{test.capacity}"
test.set('moon', 'silver')

puts test
puts "Length is currently #{test.length}, capacity is currently #{test.capacity}"

puts "Testing all other methods:"
puts "get('hat'): #{test.get('hat')}"
puts "set('me', 'tan'): #{test.set('me', 'tan')}"
puts "has?('hat'): #{test.has?('hat')}"
puts "remove('frog'): #{test.remove('frog')}"
puts "values: #{test.values}"
puts "keys: #{test.keys}"
puts "entries: #{test.entries}"
puts "Before we clear: here's the current Hash Map:"
puts test
puts "Clearing makes the hash map:"
test.clear
puts test