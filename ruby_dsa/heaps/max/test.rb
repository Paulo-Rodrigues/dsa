require 'minitest/autorun'
require_relative './impl'

# [50, 12, 32, 10, 11, 9, 8, 7] - 45
describe MaxBinaryHeap do
  let(:numbers) { [50, 12, 32, 10, 11, 9, 8, 7] }
  let(:heap) { MaxBinaryHeap.new }

  describe '#insert' do
    it '#empty?' do
      _(heap.empty?).must_equal(true)
    end

    it 'without bubble up' do
      heap.insert(50)

      _(heap.empty?).must_equal(false)
      _(heap.values).must_equal([50])
    end

    it 'without bubble' do
      numbers.each { |number| heap.insert(number) }

      _(heap.empty?).must_equal(false)
      _(heap.values).must_equal([50, 12, 32, 10, 11, 9, 8, 7])
    end

    it 'with bubble' do
      numbers.each { |number| heap.insert(number) }

      heap.insert(45)

      _(heap.empty?).must_equal(false)
      _(heap.values).must_equal([50, 45, 32, 12, 11, 9, 8, 7, 10])
    end
  end
end
