class MaxBinaryHeap
  attr_reader :values

  def initialize
    @values = []
  end

  def insert(value)
    values << value
    bubble_up
  end

  def empty?
    values.empty?
  end

  private

  def bubble_up
    idx = values.size - 1

    while idx.positive?
      parent_idx = (idx - 1) / 2
      break unless values[idx] > values[parent_idx]

      values[parent_idx], values[idx] = values[idx], values[parent_idx]
      idx = parent_idx
    end
  end
end
