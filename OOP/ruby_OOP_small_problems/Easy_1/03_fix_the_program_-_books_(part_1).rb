class Book
  attr_reader :title, :author
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)
##FE:
#What are the differences between attr_reader, attr_writer, and attr_accessor? Why did we use attr_reader instead of one of the other two? Would it be okay to use one of the others? Why or why not?
### The difference is that attr_reader just creates the getter methods, attr_writer just creates the setter methods, and attr_accessor creates both, and instance variables with the same names as the symbols.

#Instead of attr_reader, suppose you had added the following methods to this class:

#def title
#  @title
#end
#
#def author
#  @author
#end
#Would this change the behavior of the class in any way? If so, how? If not, why not? Can you think of any advantages of this code?
### This would be the same as adding attr_reader, except that it would allow you to modify the output of the reader, or else change what happens before a variable is set. This would be useful for instance if you wanted to mask a password.
