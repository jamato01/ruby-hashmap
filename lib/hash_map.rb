# This class creates and manipulates HashMaps
class HashMap
  attr_accessor :length

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
    @length = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @capacity
  end

  def set(key, value)
    hash_code = self.hash(key)

    if @buckets[hash_code].nil?
      @buckets[hash_code] = LinkedList.new(key, value)
      @length += 1
    else
      #add to linked list (if nil it will just become the head of a linked list)
      if @buckets[hash_code].contains_key?(key)
        #replace value for key
        key_index = @buckets[hash_code].find_key(key)
        @buckets[hash_code].remove_at(key_index)
        @buckets[hash_code].insert_at(key, value, key_index)
      else
        #add value to end of linked list
        @buckets[hash_code].append(key, value)
        @length += 1
      end
    end 
  end

  def get(key)
    hash_code = self.hash(key)

    if @buckets[hash_code].nil? || @buckets[hash_code].find_key(key).nil?
      return nil
    else
      key_index = @buckets[hash_code].find_key(key)
      return @buckets[hash_code].at(key_index).value
    end
  end

  def has?(key)
    @capacity.times do |index|
      next if @buckets[index].nil?
      return true if @buckets[index].contains_key?(key)
    end
    false
  end

  def remove(key)
    return nil if !self.has?(key)
    hash_code = self.hash(key)

    key_index = @buckets[hash_code].find_key(key)
    @buckets[hash_code].remove_at(key_index).value
  end

  def clear
    @capacity = 16
    @length = 0
    @buckets = Array.new(@capacity)
  end

  def keys
    keys_array = []
    @capacity.times do |buckets_index|
      next if @buckets[buckets_index].nil?
      @buckets[buckets_index].size.times do |linked_list_index|
        keys_array << @buckets[buckets_index].at(linked_list_index).key
      end
    end
    keys_array
  end

  def values
    values_array = []
    @capacity.times do |buckets_index|
      next if @buckets[buckets_index].nil?
      @buckets[buckets_index].size.times do |linked_list_index|
        values_array << @buckets[buckets_index].at(linked_list_index).value
      end
    end
    values_array
  end

  def entries
    
  end

  def to_s
    hash_map_print = ""
    @capacity.times do |index|
      hash_map_print += "#{index}: #{@buckets[index]}\n"
    end
    hash_map_print
  end
end
