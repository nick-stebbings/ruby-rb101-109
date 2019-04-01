# write a method taking a string as input
# string contains one or more words
# Algorithm: - split the string into an array
#            - map to new array using length > 5 condition 
#            - join back into string
# return a string with all 5 or more letter words reversed


def reverse_words(str)
  arr = str.split
  arr.map do |x| 
    if x.length >= 5 
      x.reverse!
    else
      x
    end
  end
  arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS