# PROBLEM:Create a method that returns true if the integer given is a palindrome
# EXAMPLES: See question
# DATA STRUCTURES: input is an integer
# ALGORITHM: - take the int and convert it to string. Then run it through the palindrome? method.
def palindrome?(string)
  string.reverse == string
end
def int_palindrome?(int)
  palindrome?(int.to_s)
end
p int_palindrome?('00034543000')
p int_palindrome?(123210) == false
p int_palindrome?(22) == true
p int_palindrome?(5) == true

# If the integer has 0's at the front, they will be removed when Ruby parses the integer again. However you could use strformat to make sure it always has zeroes on the front.
  