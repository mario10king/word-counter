module Stemmer
  module Verb
    def self.unconjugate(word)
      case word
      when custom_words[word] && word
        custom_words[word]
      when /(s|x|sh|ch)(es)\z/
        word.gsub(/(s|x|sh|ch)(es)\z/){ |str| str.delete_suffix("es")}
      when /(ed)\z/
        word.gsub(/(ed)\z/, "")
      when /(ing)\z/
        word.gsub(/(ing)\z/, "")
      when /[^s](s)\z/
        word.gsub(/[^s](s)\z/){ |str| str.delete_suffix("s")}
      else
        word
      end
    end

    def self.custom_words
      {}
    end
  end

  module Noun
    def self.singularize(word)
      case word
      when custom_words[word] && word
        custom_words[word]
      when /(s|x|sh|ch)(es)\z/
        word.gsub(/(s|x|sh|ch)(es)\z/){ |str| str.delete_suffix("es")}
      when /(ies)\z/
        word.gsub(/(ies)\z/, "y")
      when /(s)\z/
        word.gsub(/(s)\z/, "")
      else
        word
      end
    end

    def self.custom_words
      {"heroes" => "hero"}
    end
  end
end
