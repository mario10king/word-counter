require 'test_helper'
require_relative '../../lib/stemmer'

class StemmerTest < ActiveSupport::TestCase
  def verbs
    {"talk" => ["talking", "talks", "talked", "talk"], "pass" => ["pass", "passing", "passed", "passes"]}
  end

  #def test_verb_stemmer 
    #verbs.each do |key, values| 
      #values.each do |value| 
        #unconjugated_word = Stemmer::Verb::unconjugate(value)
        #assert_equal key, unconjugated_word 
      #end
    #end
  #end

  def nouns
    {"cat" => ["cats", "cat"], "hero" => ["heroes"]}
  end

  def test_noun_stemmer
    nouns.each do |key, values| 
      values.each do |value| 
        unpluralized_word = Stemmer::Noun::singularize(value)
        assert_equal key, unpluralized_word 
      end
    end
  end
end
