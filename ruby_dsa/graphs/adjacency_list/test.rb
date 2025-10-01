require 'minitest/autorun'
require_relative './impl'

describe AdjacencyList do
  let(:graph) { AdjacencyList.new }

  describe 'empty graph' do
    it 'returns true' do
      _(graph.empty?).must_equal true
    end
  end

  describe '#add_vertex' do
    it 'add_vertex' do
      graph.add_vertex('A')

      _(graph.empty?).must_equal false
      _(graph.adjacency_list).must_equal({ 'A' => [] })
    end

    it 'add_vertex with existing vertex' do
      graph.add_vertex('A')
      graph.add_vertex('A')

      _(graph.empty?).must_equal false
      _(graph.adjacency_list).must_equal({ 'A' => [] })
    end

    it 'add_vertex with multiple vertices' do
      graph.add_vertex('A')
      graph.add_vertex('B')
      graph.add_vertex('C')

      _(graph.empty?).must_equal false
      _(graph.adjacency_list).must_equal({ 'A' => [], 'B' => [], 'C' => [] })
    end
  end

  describe '#add_edge' do
    it 'add_edge' do
      graph.add_vertex('A')
      graph.add_vertex('B')
      graph.add_edge('A', 'B')

      _(graph.adjacency_list).must_equal({ 'A' => ['B'], 'B' => [] })
    end

    it 'add_edge for multiple edges' do
      graph.add_vertex('A')
      graph.add_vertex('B')
      graph.add_vertex('C')
      graph.add_edge('A', 'B')
      graph.add_edge('A', 'C')

      _(graph.adjacency_list).must_equal({ 'A' => %w[B C], 'B' => [], 'C' => [] })
    end
  end
end
