=begin
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.

Understanding the problem:
input: 2 arguments: 1. a string and 2. an array of strings
output: 3. a sub array that contains all the anagrams of the word.

Requirements:
- create an Anagram class and object
- pass in the word as an argument when instantiating a new object
- define an instance method match that takes an array of strings
- return an empty array if theres no match
- return an array of string if there is one or more that matches
- case insensitive
- cannot return the same word (in any case), is only looking for ANAGRAMS (new words)

example:

Anagram.new('listen')
detector.match %w(enlists google inlets banana)

should return [inlets]

first reject all the ones that have the same letters lowercase as the main word

then we can sort and lowercase case them to compare and select the ones that match

Metal Model: Create a new anagram object that takes ones string word and when we invoke the match method that takes an array of words returns an array of anagrams of the initial word

Data Structure:
One class: Anagram
one instance variable: @word
one method: match(str_arr)
2 iterators: rejector iterator, selector iterator

Algorithm:
define class Anagram

define Anagrams constructor (word)
  - save word as @word instance variable

define Anagram#match instance method (sub_arr)
  - iterate! over sub_arr(word)
      - reject word lowercase that is equal to @word
  - iterate over sub_arr(word)
      - select and verify word that's equal to @word verified
  - return array

define private helper method verify_anagram (word)
  - sort the characters of lowercase word

intantiate new anagram object and pass in word as argument
=end

class Anagram

  def initialize(word)
    @word = word
  end

  def match(str_arr)
    str_arr.reject! { |word| word.downcase == @word }
    str_arr.select { |word| verify(word) == verify(@word)}
  end

  private

  def verify(word)
    word.downcase.chars.sort
  end

end

anagrams = Anagram.new('listen')
anagrams.match(%w(enlists inlets google banana))
