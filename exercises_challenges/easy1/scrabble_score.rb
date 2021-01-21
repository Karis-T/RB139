class Scrabble
  TILE_SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z),
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if valid?
    total = 0
    TILE_SCORES.each do |key, value|
      @word.upcase.chars.each { |letter| total += key if value.include?(letter)}
    end
    total
  end

  private

  def valid?
    return 0 if @word.nil? || @word.match?(/[\W]/)
  end

  def self.score(word)
    self.new(word).score
  end
end