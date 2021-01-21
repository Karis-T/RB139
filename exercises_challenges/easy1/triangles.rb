=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than or equal to the length of the third side.

Understanding the problem:

inputs: 3 integers
outputs: a string representing either equilaterial, isosceles, scalene or an ArgumentError if its not a triangle

Requirements:
- create a class Triangle
- with constructor we determine if it is a triangle at all
- create a helper method triangle? that raises an argument error if its sides are less than 0 AND the sum of any 2 sides are less than the length of the 3rd side
- define an instance method kind? that will return either equilateral, isosceles or scalene
- case statement?

Mental Model: Create a new triangle object that will first verify if its a valid triangle. If it is save it, if it isnt raise an ArgumentError. Once verified determine how many sides are equal and return a string of either equilateral, isosceles or scalene

Examples: equilateral
(2,2,2)
take the first side = 1
count up how many sides are the same
if side == 3 then equilateral
if side == 2 then isosceles
if side == 1 then scalene

determine if sides are a valid_triangle?
iterate over all sides to see if any are 0 or below AND if any 2 sides are greater than the 3rd side
(all) method

if false raise an argumenterror

how to check if any 2 sides are greater than the 3rd side?

(7,3,2)

7+3 == 10
2+7 == 9
3+2 == 5 => ArgumentError

determine the max (sort and pull the last value out of the array)
sum the other 2 sides together

Data Structure:
convert the intergers into an array of integers
return a string or ArgumentError

1 class Triangle
1 instance variable @sides
1 helper method valid_triangle?
 - 1 iterator
1 instance method kind
 - 1 iterator that counts the number of sides that are equal

Algorithm:
create a class Triangle
define Triangles constructor (*sides)
    if valid_triangle?(sides) returns true
    save sides to @sides

define instance method kind
    store return value of count_sides invocation in equal_sides
    when equal_sides is 1 return 'scalene'
    when equal_sides is 2 return 'isosceles'
    when equal_sides is 3 return 'scalene'

define private helper method count_sides
    count the uniq elements in @sides

define private helper method valid_triangle? (sides)
    iterate over all sides (side)
        return ArgumentError if
        any side is 0 or below
        OR if any 2 side combined are smaller than the largest 3rd side

=end

class Triangle
  def initialize(*sides)
    @sides = valid_triangle?(sides)
  end

  def kind
    case count_sides
    when 3 then 'scalene'
    when 2 then 'isosceles'
    when 1 then 'equilateral'
    end
  end

  private

  def valid_triangle?(sides)
    sides.sort!
    raise ArgumentError if sides.all? do |side|
      side <= 0 || sides[2] > sides[0] + sides[1]
    end
    sides
  end

  def count_sides
    @sides.uniq.length
  end
end

p Triangle.new(4, 3, 4).kind