class BeerSong
  def self.verse(num)
    return verse_zero if num.zero?
    "#{num} bottle#{num == 1 ? nil : "s"} of beer on the wall, #{num} bottle#{num == 1 ? nil : "s"} of beer.\n" \
      "Take #{num == 1 ? "it" : "one"} down and pass it around, #{num - 1 == 0 ? "no more" : num - 1} bottle#{num == 2 ? nil : "s"} of beer on the wall.\n"
  end

  def self.verse_zero
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.verses(num1, num2)
    rev_arr = (num2..num1).to_a.reverse
    rev_arr.map{|num| verse(num)}.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

#puts BeerSong.lyrics