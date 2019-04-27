require 'securerandom'

def uuid
  p "#{SecureRandom.hex(4)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(6)}"
end
uuid
# Looks like I cheated! I will come back and redo this.

hex_digits = (0..9).to_a.map{|num| num.to_s}
HEX = hex_digits + %w(a b c d e f)
SECTIONS = [8, 4, 4, 4, 12]
def uuid2
  uuid_str = ''
  SECTIONS.each{ |length|
    length.times{
      uuid_str += HEX.sample
    }
  uuid_str += '-'
  }
  p uuid_str.chop!
end
uuid2