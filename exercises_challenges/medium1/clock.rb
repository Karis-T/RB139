class Clock
  def initialize(hr, min)
    @hr = hr
    @min = min
  end

  def self.at(hr, min=0)
    Clock.new(hr, min)
  end

  def to_s
    format('%02d:%02d', @hr, @min)
  end

  def +(mins)
    hrs, mins = mins.divmod(60)
    @hr += hrs
    @hr = 0 if @hr == 24
    @hr %= 24 if @hr >= 24
    Clock.new(@hr, @min + mins)
  end

  def -(mins)
    hrs, mins = mins.divmod(60)
    hrs %= 24 if hrs >= 24
    @hr = 24 if @hr == 0
    @hr -= 1 if @min == 0 && @hr != 0
    @min = 60 if @min == 0
    Clock.new((@hr - hrs).abs, (@min - mins).abs)
  end

  def ==(other)
    other.to_s == self.to_s
  end
end

puts Clock.at(8).to_s
puts Clock.at(11, 9).to_s
clock = Clock.at(10) + 3
puts clock
clock = Clock.at(10) + 61
puts clock
clock = Clock.at(23, 30) + 60
puts clock
clock = Clock.at(10) + 3061
puts clock

clock = Clock.at(0) - 50
puts clock #23:10
clock = Clock.at(10, 30) - 5
puts clock #10:25
clock = Clock.at(10) - 90
puts clock
clock = Clock.at(10) - 3061
puts clock #06:59