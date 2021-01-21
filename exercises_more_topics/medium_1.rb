#1
class Device
  def initialize
    @recordings = []
  end

  def listen
    record(yield) if block_given?
  end

  def record(recording)
    @recordings << recording
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

#3

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Nice selection of food we have gathered!"
end

items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) {|items| puts "#{items.join(', ')}"}

#4

def solve(array)
  yield(array)
end

array = %w(raven finch hawk eagle)

p solve(array) {|_, _, *raptors| raptors}

#5
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*args , wheat|
  puts *args.join(", ")
  puts wheat
end

gather(items) do | apples, *args , wheat |
  puts apples
  puts args.join(", ")
  puts wheat
end

gather(items) do |apples , *args |
  puts apples
  puts args.join(", ")
end

gather(items) do |apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

#6

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc) # => [10, 12, 14, 16, 20, 41]

# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# # ->

# Proc.new { |n| n.to_s(8).to_i }
# #when we use & to convert our Proc to a block, it expands out to...

# # ->
# [8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }

#7
def bubble_sort!(arr)
  loop do
    sorted = 0
      (arr.length-1).times do |i|
        if block_given?
          next sorted += 1 if yield(arr[i], arr[i+1])
        else
          next sorted += 1 if arr[i] < arr[i+1]
        end
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    break if sorted == arr.length-1
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
