hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# write some code to output all of the vowels from the strings
hsh.map {|_,v|
  p v.map { |val|
    val.chars.select {|chr|
      chr.match(/[aeiou]/)
      }.join('')
    }.join('')
  }.join('')