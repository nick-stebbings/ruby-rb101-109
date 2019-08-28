class Book
  attr_accessor :title, :author
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

## FE:
#What do you think of this way of creating and initializing Book objects? (The two steps are separate.) Would it be better to create and initialize at the same time like in the previous exercise? What potential problems, if any, are introduced by separating the steps?
# This is a more cumbersome way to initialize the state of the objects, and it would seem to me to be better if the information was just passed into the constructor method and set there. That way, if you needed to alter or ouput the state afterwards, you could define setter/getter methods if they were needed. This limits the public interface which encapsulates the state.