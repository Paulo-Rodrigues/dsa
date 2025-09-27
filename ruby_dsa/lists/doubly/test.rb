require 'minitest/autorun'
require_relative './impl'

# methods
#   - push   -> adiciona valor no final
#   - pop    -> remove valor do final
#   - search -> busca um valor ou retorna nil
#   - invert -> inverte a lista (ordem e ponteiros)
#

describe Doubly do
  let(:list) { Doubly.new }

  describe '#empty?' do
    it 'return true on empty list' do
      _(list.empty?).must_equal(true)
    end
  end

  describe '#push' do
    it 'on empty list' do
      list.push(2)

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(1)
      _(list.head.value).must_equal(2)
      _(list.tail.value).must_equal(2)
      _(list.head.prev_node).must_be_nil
      _(list.tail.next_node).must_be_nil
    end

    it 'on non empty list' do
      list.push(2)
      list.push(3)
      list.push(4)

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(3)

      _(list.head.value).must_equal(2)
      _(list.head.next_node.value).must_equal(3)
      _(list.tail.value).must_equal(4)
      _(list.tail.prev_node.value).must_equal(3)
    end
  end

  describe '#pop' do
    it 'return nil on empty list' do
      _(list.pop).must_be_nil
    end

    it 'when single element' do
      list.push(2)

      list.pop

      _(list.empty?).must_equal(true)
      _(list.size).must_equal(0)
      _(list.head).must_be_nil
      _(list.tail).must_be_nil
    end

    it 'when multiple elements' do
      list.push(2)
      list.push(3)
      list.push(4)

      list.pop

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(2)
      _(list.head.value).must_equal(2)
      _(list.tail.value).must_equal(3)
      _(list.tail.next_node).must_be_nil
    end
  end

  describe '#search' do
    it 'return nil on empty list' do
      _(list.search(2)).must_be_nil
    end

    it 'finds element in the middle' do
      list.push(2)
      list.push(3)
      list.push(4)

      result = list.search(3)

      _(result.value).must_equal(3)
      _(result.prev_node.value).must_equal(2)
      _(result.next_node.value).must_equal(4)
    end

    it 'returns nil when value not found' do
      list.push(2)
      list.push(3)
      list.push(4)

      _(list.search(5)).must_be_nil
    end
  end

  describe '#invert' do
    it 'correctly inverts the list' do
      list.push(2)
      list.push(3)
      list.push(4)

      list.invert

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(3)

      _(list.head.value).must_equal(4)
      _(list.head.next_node.value).must_equal(3)
      _(list.head.prev_node).must_be_nil

      _(list.tail.value).must_equal(2)
      _(list.tail.prev_node.value).must_equal(3)
      _(list.tail.next_node).must_be_nil
    end
  end
end
