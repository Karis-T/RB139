=begin
By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

Understanding the problem:
input: string (of dna)
output: integer of how many mutations (return value of hamming_distance)

Requirements:
- create a DNATest class
- create a constructor that takes 1 string as an argument and sets it to @dna
- define a hamming_distance method that takes a string as an argument
  - iterate over string characters and compare with @dna with mutation count all the differences
- return an integer of the differences

Mental Model: Create an object that will take a string of dna as an argument. Compare this with a mutation string when hamming_distance is invoked and return the number of differences in the strands.

Example:
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

G is mutated (does not match)
A is find (does match)
G is mutated

reject the letters of the index which are the same as original dna

Data Structure:
string characters split into arrays

1 class DNATest
1 instance variable @dna
1 instance method hamming_distance
  1 iterator for rejecting similarieties

Algorithm:
Create a class DNATest
  define constructor (dna)
    save dna characters to @dna

    define method hamming_distance (strand)
      find the total_length of strand
      slice @dna from first to total_length
      store result in short_dna
      iterate over short_dna (base, idx)
          reject strand[idx] if its equal to base
      store result into mutations
      find the length of mutations
=end

class DNA
  def initialize(dna)
    @dna = dna.chars
  end

  def hamming_distance(strand)
    total_length = strand.length
    short_dna = @dna[0, total_length]
    mutations = short_dna.reject.with_index{|base, idx| base == strand[idx]}
    mutations.length
  end
end

