def bubble(arr)
  loop do
    swapped = false

    (arr.size - 1).times do |i|
      next unless arr[i] > arr[i + 1]

      arr[i], arr[i + 1] = arr[i + 1], arr[i]

      swapped = true
    end

    break unless swapped
  end

  arr
end
