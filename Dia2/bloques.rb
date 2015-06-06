def function(array)
  if block_given?
    new_array = []
    array.each_with_index do |item, i|
      new_array.push(yield(item, i))
    end
  else
    return array
  end
  new_array
end

print function([1, 2, 3, 4]) { |x, i| x * i }
