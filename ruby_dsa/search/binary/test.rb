require 'minitest/autorun'
require_relative './impl'

describe 'binary search' do
  let(:arr) { [2, 5, 8, 12, 16, 23, 38, 56, 72, 91] }

  describe 'found' do
    it do
      target = 23

      _(binary_search(arr, target)).must_equal(23)
    end

    it do
      target = 56

      _(binary_search(arr, target)).must_equal(56)
    end

    it do
      target = 8

      _(binary_search(arr, target)).must_equal(8)
    end
  end

  describe 'not found' do
    it 'target not on array' do
      target = 100

      _(binary_search(arr, target)).must_equal(false)
    end
  end
end
