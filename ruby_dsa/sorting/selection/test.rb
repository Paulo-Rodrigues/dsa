require 'minitest/autorun'
require_relative './impl'

describe 'selection' do
  it 'sort the array' do
    arr = [14, 28, 38, 15, 41, 11, 5, 19, 36]

    _(selection(arr)).must_equal(arr.sort)
  end
end
