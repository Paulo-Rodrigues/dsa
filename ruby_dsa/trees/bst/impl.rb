class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end
end

class BST
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = TreeNode.new(value)

    return @root = new_node if empty?

    current = @root

    loop do
      if value < current.value
        current.left ? current = current.left : (break current.left = new_node)
      elsif value > current.value
        current.right ? current = current.right : (break current.right = new_node)
      else
        break
      end
    end
  end

  def search(value)
    return nil if empty?

    current = @root

    while current
      return true if value == current.value

      current = value < current.value ? current.left : current.right
    end

    false
  end

  def in_order(current = @root, result = [])
    return result if current.nil?

    in_order(current.left, result)
    result << current.value
    in_order(current.right, result)

    result
  end

  def pre_order(current = @root, result = [])
    return result if current.nil?

    result << current.value
    pre_order(current.left, result)
    pre_order(current.right, result)

    result
  end

  def post_order(current = @root, result = [])
    return result if current.nil?

    post_order(current.left, result)
    post_order(current.right, result)
    result << current.value

    result
  end

  def empty?
    root.nil?
  end
end
