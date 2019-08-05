module Parser
  def self.parse(words)
    parsed_words = [] 
    words.each do |word|
      next if word.match?(/\d/)
      new_word = word.downcase
      parsed_words << new_word.gsub(/\W/, "")
    end
    parsed_words
  end
end
