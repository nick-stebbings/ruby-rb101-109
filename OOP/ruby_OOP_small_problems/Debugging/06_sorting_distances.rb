class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 1.609344, nmi: 1.8519993 })
  end

  def as_miles
    convert_to(:mi, { km: 0.62137119, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 0.539957, mi: 1.15078, nmi: 1 })
  end

  def ==(other)
    case self.unit
    when :km  then (self.value == other.as_kilometers.value)
    when :mi  then (self.value == other.as_miles.value)
    when :nmi then (self.value == other.as_nautical_miles.value)
    end
  end

  def <(other)
    case self.unit
    when :km  then self.value < other.as_kilometers.value
    when :mi  then self.value < other.as_miles.value
    when :nmi then self.value < other.as_nautical_miles.value
    end
  end

def <=>(other)
  case
  when self < other then -1
  when self > other then 1
  when self == other then 0
  end
end
    
  def <=(other)
    self < other || self == other
  end

  def >(other)
    !(self <= other)
  end

  def >=(other)
    self > other || self == other
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value * conversion_factors[unit]).round(4), target_unit)
  end
end

# Example
#mi =Length.new(1, :mi)
#nmi =Length.new(1, :nmi)
#km =Length.new(1, :km)
#puts mi >= nmi
#puts mi > km
puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 nmi
# 1 mi