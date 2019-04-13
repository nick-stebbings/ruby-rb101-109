arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain
p arr.sort{|a , b| b.odd? ? -1 : a <=> b } #WRONG! Couldn't figure it out so I looked.