require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test

  def setup
    @file = File.open("text.txt")
    str = @file.read
    @text = Text.new(str)
  end

  def test_swap
    outcome = @text.swap("a", "e")
    refute_includes(outcome,"a")
  end

  def test_word_count
    outcome = @text.word_count
    assert_equal(72, outcome)
  end

  def teardown
    @file.close
  end
end