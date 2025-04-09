def bubble_sort(array)
  n = array.size
  (0...n).each do |i|
    (0...(n - i - 1)).each do |j|
      array[j], array[j + 1] = array[j + 1], array[j] if array[j] > array[j + 1]
    end
  end
  array
end



sorted_array = bubble_sort([4, 3, 78, 2, 0, 2])
print sorted_array
