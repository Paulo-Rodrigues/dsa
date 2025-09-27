def selection(arr)
  n = arr.size

  (0...n - 1).each do |i|
    min_index = i

    (i + 1...n).each do |j|
      min_index = j if arr[j] < arr[min_index]
    end

    arr[i], arr[min_index] = arr[min_index], arr[i] if min_index != i
  end

  arr
end
