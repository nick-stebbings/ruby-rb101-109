# P :
 # Complete this class so that the test cases shown below work as intended. You are free  # to add any methods or instance variables you need. However, do not make the  
# implementation details public.

#You may assume that the input will always fit in your terminal window.
# Test Cases
=begin
banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+
=end
class Banner
  SCREEN_WIDTH = 80
  PADDING = 2
  ALIGN = [:left, :right, :center][1]
  
  def initialize(message, banner_width = (message.size + 2))
    banner_width = message.size if banner_width < message.size
    min_width_inner = ([SCREEN_WIDTH - 4, banner_width].min)
#(SCREEN_WIDTH - (PADDING * 2) - 4)
    @width_inner = [min_width_inner - (2 * PADDING), 1].max
    @message = message.length > @width_inner ? wrap(message, @width_inner, maintain_word_boundary: true) : message
    @pad = (' ' * PADDING)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].flatten.join("\n")
  end

  private

  def word_wrap(message, limit)
    lines, finished = [], nil
    words = message.split /\b/
    loop do
      line = []
      loop do
        line.push(words.shift)
        finished = words.empty?
        break if (line.join.size >= limit) || finished
      end
      lines << (finished ? line : line[0..-2])
      break if finished
      words.unshift(line.pop)
    end
    lines
  end

  def character_wrap(message, limit)
    lines = []
    chars = message.chars
    until chars.empty?
      lines.push(chars.take(limit))
      chars = chars.drop(limit)
    end
    lines
  end

  def wrap(msg, limit = @width_inner, maintain_word_boundary: false)
    lines = maintain_word_boundary ? word_wrap(msg, limit) : character_wrap(msg, limit)
    lines.map(&:join)
  end

  def aligned(message, side = :left)
    case side
    when :left
      "#{message}".ljust(@width_inner)
    when :right
      "#{message}".rjust(@width_inner)
    when :center
      "#{message}".center(@width_inner)
    end
  end

  def horizontal_rule
    pad = @pad.gsub(' ', '-')
    "+#{pad}#{('-' * @width_inner)}#{pad}+"
  end

  def empty_line
    "|#{@pad}#{(' ' * @width_inner)}#{@pad}|"
  end

  def message_line
    if Array === @message
      str = @message.each_with_object('') do |line, result|
        result << "|#{@pad}" << aligned(line, ALIGN) << "#{@pad}|\n"
      end
      str.strip
    else
    "|#{@pad}" << aligned(@message, ALIGN) << "#{@pad}|"
    end
  end
end
box = Banner.new('Hey yall')
box1 = Banner.new('The quick brown fox jumped over the lazy dog', 15)
box2 = Banner.new('')
lipsum = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
box3 = Banner.new(lipsum, 60)
box4 = Banner.new(lipsum, 100)
box5 = Banner.new(lipsum, 10)
puts box
puts box1
puts box2
puts box3
puts box4
puts box5