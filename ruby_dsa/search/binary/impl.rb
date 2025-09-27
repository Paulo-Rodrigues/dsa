def binary_search(arr, target)
  left = 0
  right = arr.size - 1

  while left < right
    mid = (left + right) / 2

    return arr[mid] if arr[mid] == target

    right = mid - 1 if arr[mid] > target

    left = mid + 1 if arr[mid] < target
  end

  false
end
