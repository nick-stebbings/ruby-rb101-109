require 'securerandom'

def uuid
  p "#{SecureRandom.hex(4)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(6)}"
end
uuid
# Looks like I cheated! I will come back and redo this.