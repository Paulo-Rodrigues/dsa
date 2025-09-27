class SinglyNode
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class Singly
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def push(value)
    new_node = SinglyNode.new(value)

    if empty?
      @head = new_node
      @tail = @head
    else
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
      current = @head

      current = current.next_node while current.next_node != @tail

      current.next_node = nil
      @tail = current
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
    prev = nil
    current = @head

    while current
      temp = current.next_node
      current.next_node = prev
      prev = current
      current = temp
    end

    @head, @tail = @tail, @head
  end

  def empty?
    head.nil? && tail.nil? && size.zero?
  end
end
