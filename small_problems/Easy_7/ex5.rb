# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count as
# characters when switching between upper and lowercase.

#EXAMPLES:
# puts staggered_case('I Love Launch School!')     # => 'I LoVe lAuNcH ScHoOl!'
# puts staggered_case('ALL_CAPS')                  # => 'AlL_CaPs'
# puts staggered_case('ignore 77 the 444 numbers') # => 'IgNoRe 77 ThE 444 NuMbErS'

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: new string

# ALGORITHM - string.chars
#           - map over array (or each_with_index)
#             - if array index.even? then char.upcase
#             - if array index.odd? then char.upcase
#           - join array
=begin
# CODE:
def staggered_case(str)
  chars = str.chars.map.with_index do |char, idx|
    if idx.even?
      char.upcase
    else
      char.downcase
    end
  end
  chars.join
end
# FURTHER EXPLORATION:
=end
def staggered_case(str, first_is_upcase = true)
  ind = (0..str.size.pred)
  ups = ind.select(&:even?).map { |idx| str[idx].downcase }
  downs = ind.select(&:odd?).map { |idx| str[idx].upcase }
  str = ups.zip(downs).flatten.join('')
  first_is_upcase ? str.swapcase : str
end
puts staggered_case('I Love Launch School!', false)     # => 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS')                  # => 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') # => 'IgNoRe 77 ThE 444 NuMbErS'