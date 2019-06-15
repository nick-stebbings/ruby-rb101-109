# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

# Too difficult to modify previous method, so starting again

UPPERS = ('A'..'Z')
DOWNERS = ('a'..'z')
def staggered_case_2(str, upper = true, ignore_nonalpha = false)
  match = ignore_nonalpha ? /[[:alpha:]]/ : /\w/
  arr = str.chars.map do |char|
    if char =~ match
      if upper
        char.upcase!
      else
        char.downcase!
      end
      upper = !upper
      char
    else
      char
    end
  end
  arr.join('')
end
p staggered_case_2('I Love Launch School!')# == 'I lOvE lAuNcH sChOoL!'
p staggered_case_2('ALL CAPS') #== 'AlL cApS'
p staggered_case_2('ignore 77 the 444 numbers', false, false)# == 'IgNoRe 77 ThE 444 nUmBeRs'