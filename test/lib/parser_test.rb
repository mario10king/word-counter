require_relative '../../lib/parser'

class ParserTest < ActiveSupport::TestCase
  def words 
    ["a", "test", "foo>?", "a", "Foo", "FOO.", "123", "foo1", "I"]
  end

  def sanitized_words
    ["a", "test", "foo", "a","foo", "foo", "i"]
  end

  def count
    {"test" => 1, "a" => 2, "foo" => 3, "i" => 1}
  end

  def test_parse_without_stop_words_removed
    parsed_words = Parser::parse(words, false)
    assert_equal count, parsed_words 
  end

  def test_parse_with_stop_words 
    result = {"test" => 1, "foo" => 3}
    parsed_words = Parser::parse(words, true)
    assert_equal result, parsed_words 
  end

  def test_parse_words 
    parsed_words = Parser::parse_words(words)
    assert_equal sanitized_words, parsed_words 
  end

  def test_sanitize_word
    word = "Foo."
    expected_word = "foo"
    sanitized_word = Parser::sanitize_word(word)
    assert_equal expected_word, sanitized_word 
  end

  def test_sanitize_word_with_digit
    word = "2"
    expected_word = false 
    sanitized_word = Parser::sanitize_word(word)
    assert_equal expected_word, sanitized_word 
  end

  def test_stem
    word = "passes"
    expected_word = "pass"
    stemmed_word = Parser::stem(word)
    assert_equal expected_word, stemmed_word 
  end

  def test_count
    words_count = Parser::count(sanitized_words)
    assert_equal count, words_count 
  end

  def test_remove_stop_words 
    result = {"test" => 1, "foo" => 3}
    words_count = Parser::remove_stop_words(count)
    assert_equal result, words_count 
  end
end
