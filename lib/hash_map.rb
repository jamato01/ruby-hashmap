# This class creates and manipulates HashMaps
class HashMap

  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    if has?(key)
      #replace value
    else
      #add to linked list (if nil it will just become the head of a linked list)
    end 
  end

  def get(key)
    
  end

  def has?(key)

  end

  def remove(key)
    
  end

  def length
    
  end

  def clear
    
  end

  def keys
    
  end

  def values
    
  end

  def entries
    
  end
end
