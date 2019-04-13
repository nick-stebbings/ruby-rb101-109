def dot_separated_ip_address?(input_string)
  dot_separated_numbers = input_string.split(".")
  if dot_separated_numbers.size == 4
    while dot_separated_numbers.size > 0 do #while the array is not empty
      element = dot_separated_numbers.pop #set a temp variable to the end number
      break if !is_an_ip_number?(element) #if that element is  not valid, break
    end
    is_an_ip_number?(element) #now returns true or false
  end
end
