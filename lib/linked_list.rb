# This class creates and manages linked lists
class LinkedList
  attr_accessor :head

  def initialize(head_key = nil, head_value = nil)
    @head = Node.new(head_key, head_value)
  end

  def append(key, value)
    # adds a new node containing value to the end of the list
    if @head.nil?
      @head = Node.new(key, value)
    else
      current_node = tail
      current_node.next_node = Node.new(key, value)
    end
  end

  def prepend(key, value)
    # adds a new node containing value to the start of the list
    @head = Node.new(key, value, @head)
  end

  def size
    # returns the total number of nodes in the list
    size = 0
    current_node = @head
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def tail
    # returns the last node in the list
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    # returns the node at the given index
    return nil if index >= size

    current_index = 0
    current_node = @head
    while current_index <= index
      return current_node if current_index == index

      current_node = current_node.next_node
      current_index += 1

    end
    current_node
  end

  def pop
    # removes the last element from the list
    return nil if @head.nil?

    popped_node = tail
    if size == 1
      @head = nil
    else
      new_tail = at(size - 2)
      new_tail.next_node = nil
    end
    popped_node
  end

  def contains?(value)
    # returns true if the passed in value is in the list and otherwise returns false
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def contains_key?(key)
    # returns true if the passed in key is in the list and otherwise returns false
    current_node = @head
    until current_node.nil?
      return true if current_node.key == key

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    # returns the index of the node containing value, or nil if not found
    current_index = 0
    current_node = @head
    until current_node.nil?
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def find_key(key)
    # returns the index of the node containing key, or nil if not found
    current_index = 0
    current_node = @head
    until current_node.nil?
      return current_index if current_node.key == key

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def to_s
    # represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    return "nil" if @head.nil?

    current_node = @head
    linked_list_print = ""
    until current_node.nil?
      linked_list_print += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    "#{linked_list_print}nil"
  end

  # Extra Credit
  # Tip: When you insert or remove a node, consider how it will affect the existing nodes.
  # Some of the nodes will need their #next_node link updated

  def insert_at(key, value, index)
    # inserts a new node with the provided value at the given index
    if @head.nil? || index == size
      append(key, value)
    elsif index > size
      puts "Index too large. Cannot insert."
    elsif index.zero?
      prepend(key, value)
    else
      new_node = Node.new(key, value, at(index))
      at(index - 1).next_node = new_node
    end
  end

  def remove_at(index)
    # removes the node at the given index
    removed_node = nil
    if index.zero?
      removed_node = @head
      @head = at(1) if size > 1
      @head = nil if size == 1
    elsif index >= size
      return puts "Index too large. Cannot remove a node that doesn't exist."
    else
      removed_node = at(index)
      at(index - 1).next_node = at(index + 1)
    end
    removed_node
  end
end
