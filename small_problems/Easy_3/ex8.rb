# PROBLEM:Create a method that returns true if the input is a palindrome. Case matters, as does the inclusion of non-letter characters
# EXAMPLES: See question
# DATA STRUCTURES: input is a string, output is a boolean
# ALGORITHM: - take the string and reverse it (preserving case and extra characters)
#            - compare this new string with the original to get boolean

def palindrome?(string)
  string.reverse == string
end
p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true

# String version:
def palindrome_a?(array)
  array.reverse == array
end
p palindrome?([1,3,5,3,2]) == false
p palindrome?([1,3,5,3,1]) == true
p palindrome?(%w(the BIG dipper)) == false
p palindrome?(%w(the BIG dipper BIG the)) == true

