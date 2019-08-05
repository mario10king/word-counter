require_relative '../../lib/parser'

class ParserTest < ActiveSupport::TestCase
  def words 
    ["test", "foo>?", "Foo", "FOO.", "123", "foo1"]
  end

  def test_parse 
    result = ["test", "foo", "foo", "foo"]
    parsed_words = Parser::parse(words)
    assert_equal result, parsed_words 
  end
end
