class DoublyNode
  attr_accessor :value, :next_node, :prev_node

  def initialize(value)
    @value = value
    @next_node = nil
    @prev_node = nil
  end
end

class Doubly
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def push(value)
    new_node = DoublyNode.new(value)

    if empty?
      @head = new_node
      @tail = @head
    else
      new_node.prev_node = @tail
      @tail.next_node = new_node
      @tail = new_node
    end

    @size += 1
  end

  def pop
    return nil if empty?

    if head == tail
      @head = nil
      @tail = nil
    else
      @tail = @tail.prev_node
      @tail.next_node = nil
    end

    @size -= 1
  end

  def search(value)
    return nil if empty?

    current = @head
    while current
      return current if value == current.value

      current = current.next_node
    end
  end

  def invert
    current = @head
    while current
      current.next_node, current.prev_node = current.prev_node, current.next_node
      current = current.prev_node
    end

    @head, @tail = @tail, @head
  end

  def empty?
    head.nil? && tail.nil? && size.zero?
  end
end
