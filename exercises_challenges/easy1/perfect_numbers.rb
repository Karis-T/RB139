=begin
The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.
Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
Write a program that can tell whether a number is perfect, abundant, or deficient.

Understand the problem:
inputs: integer
outputs: a string representing either perfect, abundant or deficient

Requirements:
- tally the alliquot sum of a number (all the numbers that are divsors of the number - excluding the number itself)
- find out if its less than (deficient)
- greater than (abundant)
- or equal to (perfect) the number in question
and return a string of which one it is
- for invalid negative numbers (or numbers less than 1) return StandardError

Mental Model: Create an class that when its method classify is invoked with a number it finds the alliquot number of it (that is all the divsors with no remainder) and determines whether its deficient, abundant or perfect. If there is a number less than 1 return a StandardError

Example:
15
yields 1,3 and 5 as divisors that can be divded evenly
its total is 9
so its considered deficient

1..15 select each number that has no remainders when 15 is the numerator

Data Structure:
use an array of integers to collect divisors
sum them and determine if sum is < > or == @number
1 class PerfectNumber
2 class methods 1 helper (alliquot_sum) and (classify)
    1 iterator to select all no remainder divisors
    an if statement to find out which type it is

Algorithm:
Create a class PerfectNumber
define a class method classify (number)
    raise a StandardError if number is less than 1
    determine the alliquot_sum of number
    if aliquot_sum is less than number return string deficient
    if aliquot_sum is greater than number return string abundant
    otherwise return perfect

define a class method alliquot_sum (number)
    iterate from 1 to number (denominator)
        select each denominator that has no remainders when number is the numerator
        sum the result
=end

class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    if aliquot_sum(number) < number then 'deficient'
    elsif aliquot_sum(number) > number then 'abundant'
    else 'perfect'
    end
  end

  def self.aliquot_sum(number)
    (1...number).select {|denominator| number % denominator == 0 }.sum
  end
end

PerfectNumber.classify(15)