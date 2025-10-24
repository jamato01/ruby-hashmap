#This class creates and manages nodes for the linked list
class Node
  attr_accessor :value, :next_node
  
  def initialize(key = nil, value = nil, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end

  def to_s
    "( #{@value} )"
  end

end