require 'minitest/autorun'
require_relative './impl'

describe BST do
  let(:tree) { BST.new }

  describe '#empty?' do
    it 'return true' do
      _(tree.empty?).must_equal(true)
    end
  end

  describe 'insert' do
    it 'on empty tree' do
      tree.insert(2)

      _(tree.root.value).must_equal(2)
      _(tree.root.left).must_be_nil
      _(tree.root.right).must_be_nil
    end

    it 'insert left' do
      tree.insert(100)
      tree.insert(90)
      tree.insert(80)

      _(tree.root.value).must_equal(100)
      _(tree.root.left.value).must_equal(90)
      _(tree.root.left.left.value).must_equal(80)
      _(tree.root.right).must_be_nil
    end

    it 'insert right' do
      tree.insert(100)
      tree.insert(900)
      tree.insert(8000)

      _(tree.root.value).must_equal(100)
      _(tree.root.right.value).must_equal(900)
      _(tree.root.right.right.value).must_equal(8000)
      _(tree.root.left).must_be_nil
    end

    it 'does not duplicate values' do
      tree.insert(100)
      tree.insert(900)
      tree.insert(900) # duplicated
      tree.insert(8000)

      _(tree.root.value).must_equal(100)
      _(tree.root.right.value).must_equal(900)
      _(tree.root.right.right.value).must_equal(8000)
      _(tree.root.left).must_be_nil
    end

    it 'complete tree' do
      tree.insert(100)
      tree.insert(90)
      tree.insert(80)
      tree.insert(900)
      tree.insert(8000)

      _(tree.root.value).must_equal(100)
      _(tree.root.left.value).must_equal(90)
      _(tree.root.left.left.value).must_equal(80)
      _(tree.root.right.value).must_equal(900)
      _(tree.root.right.right.value).must_equal(8000)
    end
  end

  describe '#search' do
    it 'when value in root' do
      tree.insert(2)

      _(tree.search(2)).must_equal(true)
    end

    it 'when found value' do
      tree.insert(100)
      tree.insert(90)
      tree.insert(80)
      tree.insert(900)
      tree.insert(8000)

      _(tree.search(80)).must_equal(true)
    end

    it 'when not found' do
      tree.insert(100)
      tree.insert(90)
      tree.insert(80)
      tree.insert(900)
      tree.insert(8000)

      _(tree.search(999)).must_equal(false)
    end

    it 'when tree is empty' do
      _(tree.search(2)).must_be_nil
    end
  end

  describe 'traversals' do
    it 'in_order' do
      expected = [80, 90, 100, 900, 8000]

      tree.insert(100)
      tree.insert(90)
      tree.insert(80)
      tree.insert(900)
      tree.insert(8000)

      _(tree.in_order).must_equal(expected)
    end

    it 'pre_order' do
      expected = [100, 90, 80, 900, 8000]

      tree.insert(100)
      tree.insert(90)
      tree.insert(80)
      tree.insert(900)
      tree.insert(8000)

      _(tree.pre_order).must_equal(expected)
    end

    it 'post_order' do
      expected = [80, 90, 8000, 900, 100]

      tree.insert(100)
      tree.insert(90)
      tree.insert(80)
      tree.insert(900)
      tree.insert(8000)

      _(tree.post_order).must_equal(expected)
    end
  end
end
