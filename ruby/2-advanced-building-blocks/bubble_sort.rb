def bubble_sort array
  k = 0
  for j in 0..array.size-1
    for i in 0..array.size-k-2
      if array[i]>array[i+1]
        array[i+1], array[i] = array[i], array[i+1]
      end
    end
    k+=1
  end
  p array
end

bubble_sort([5,4,3,2,1])
