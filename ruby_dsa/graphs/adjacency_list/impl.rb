class AdjacencyList
  attr_reader :adjacency_list

  def initialize
    @adjacency_list = Hash.new { |h, k| h[k] = [] }
  end

  def add_vertex(vertex)
    @adjacency_list[vertex] ||= []
  end

  def add_edge(vertex1, vertex2)
    @adjacency_list[vertex1] << vertex2
  end

  def empty?
    adjacency_list.empty?
  end
end
