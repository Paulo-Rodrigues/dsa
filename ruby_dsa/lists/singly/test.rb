require 'minitest/autorun'
require_relative './impl'

# methods
#   - push - pushes a value to the list
#   - pop - remove value from the tail
#   - search - find a value or return nil
#   - invert - invert the list pointers and order

describe Singly do
  let(:list) { Singly.new }

  describe '#empty?' do
    it 'return true' do
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
    end

    it 'on non empty list' do
      list.push(2)
      list.push(3)
      list.push(4)

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(3)
      _(list.head.value).must_equal(2)
      _(list.tail.value).must_equal(4)
    end
  end

  describe '#pop' do
    it 'return nil on empty list' do
      _(list.pop).must_be_nil
    end

    it 'on non empty list' do
      list.push(2)

      list.pop

      _(list.empty?).must_equal(true)
      _(list.size).must_equal(0)
      _(list.head).must_be_nil
      _(list.tail).must_be_nil
    end

    it 'on non empty list' do
      list.push(2)
      list.push(3)
      list.push(4)

      list.pop

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(2)
      _(list.head.value).must_equal(2)
      _(list.tail.value).must_equal(3)
    end
  end

  describe '#search' do
    it 'return nil on empty list' do
      _(list.search(2)).must_be_nil
    end

    it 'on non empty list' do
      list.push(2)
      list.push(3)
      list.push(4)

      result = list.search(3)

      _(result.value).must_equal(3)
    end

    it 'when not found value' do
      list.push(2)
      list.push(3)
      list.push(4)

      result = list.search(5)

      _(result).must_be_nil
    end
  end

  describe '#invert' do
    it 'correctly' do
      list.push(2)
      list.push(3)
      list.push(4)

      list.invert

      _(list.empty?).must_equal(false)
      _(list.size).must_equal(3)
      _(list.head.value).must_equal(4)
      _(list.head.next_node.value).must_equal(3)
      _(list.tail.value).must_equal(2)
    end
  end
end
