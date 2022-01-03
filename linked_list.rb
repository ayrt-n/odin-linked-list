# Class representation of Linked List
class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  # Appends value to end of linked list

  def append(value = nil)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(value, nil)
    end
  end

  # Prepends value to beginning of linked list

  def prepend(value = nil)
    @head = if @head.nil?
              Node.new(value, nil)
            else
              Node.new(value, @head)
            end
  end

  # Returns size of linked list. Returns zero if list is empty

  def size
    return 0 if @head.nil?

    count = 1
    current_node = @head
    until current_node.next_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  # Returns tail node. Returns nil if list is empty

  def tail
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  # Returns the node at given index. If list is empty or index is outside
  # of bounds of list, will return nil

  def at(index)
    return nil if @head.nil? || index > self.size

    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  # Pops (removes) last element from list

  def pop
    return if @head.nil?

    if @head.next_node.nil?
      @head = nil
    else
      prev_node = @head
      current_node = @head.next_node

      until current_node.next_node.nil?
        prev_node = current_node
        current_node = current_node.next_node
      end
      prev_node.next_node = nil
    end
  end

  # Returns true if linked list contains given value

  def contains?(value)
    return false if @head.nil?

    current_node = @head
    loop do
      return true if current_node.value == value
      break if current_node.next_node.nil?

      current_node = current_node.next_node
    end
    false
  end

  # Returns index of given value if found in list, otherwise returns nil

  def find(value)
    return nil if @head.nil?

    current_node = @head
    index = 0
    loop do
      return index if current_node.value == value
      break if current_node.next_node.nil?

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  # to_s interpretation of linked list for printing to console
  # #=> (value) -> (value) -> (value)

  def to_s
    return 'nil' if @head.nil?

    string_format = ''
    current_node = @head
    loop do
      string_format += "( #{current_node.value} )"
      break if current_node.next_node.nil?

      string_format += ' -> '
      current_node = current_node.next_node
    end
    string_format
  end

  # Inserts a new node with the provided value at a given index
  # If index value greater than linked list size, will append nil nodes until
  # index is hit

  def insert_at(value, index)
    if @head.nil?
      index.times { self.append }
      self.append(value)
    elsif index == 0
      @head = Node.new(value, @head)
    elsif index <= self.size
      prev_node = self.at(index - 1)
      index_node = self.at(index)

      new_index_node = Node.new(value, index_node)
      prev_node.next_node = new_index_node
    else
      (index - self.size).times { self.append }
      self.append(value)
    end
  end

  # Removes node at a given index

  def remove_at(index)
    return if index >= self.size

    prev_node = self.at(index - 1)
    index_node_plus_one = self.at(index + 1)

    prev_node.next_node = index_node_plus_one
  end
end

# Class representation of Node within Linked List
class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new()
# linked_list.append(1)
# linked_list.append(2)
# linked_list.append(3)
# puts linked_list
# linked_list.insert_at(0, 0)
# puts linked_list
# linked_list.insert_at(10, 10)
# puts linked_list
linked_list.insert_at(0, 0)
linked_list.insert_at(1, 1)
linked_list.insert_at(2, 2)
linked_list.remove_at(1)
puts linked_list
