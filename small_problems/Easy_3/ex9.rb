# PROBLEM:Create a method that returns true if the input is a palindrome. Case DOES NOT matter, and non-alphanumeric characters are excluded from the check
# EXAMPLES: See question
# DATA STRUCTURES: input is a string, output is a boolean
# ALGORITHM: - take the string and make it all lower case
#            - strip out non-alphanumerics
#               - using gsub!(/[^0-9a-z ]/i, '')
#            - run the palindrome? method with the new string as argument
def palindrome?(string)
  string.reverse == string
end

def real_palindrome?(str)
  palindrome?(str.downcase.gsub(/[^0-9a-z]/i, ''))
end
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false