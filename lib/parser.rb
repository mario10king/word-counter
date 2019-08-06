require_relative './stemmer'

module Parser
  def self.parse_doc(document, stop_word=false) 
    content = document.read
    words = content.split(" ")
    parse(words, stop_word)
  end

  def self.parse(words, stop_word=false)
    parsed_words = parse_words(words)
    words_count = count(parsed_words)
    if stop_word
      words_count = remove_stop_words(words_count)
    end
  end

  def self.parse_words(words)
    parsed_words = [] 
    words.each do |word|
      sanitized_word = sanitize_word(word)
      next if !sanitized_word 
      parsed_words << stem(sanitized_word) 
    end
    parsed_words
  end

  def self.sanitize_word(word)
    return false if word.match?(/\d/)
    word.downcase.gsub(/\W/, "")
  end

  def self.stem(word)
    singularized_word = Stemmer::Noun::singularize(word)
    Stemmer::Verb::unconjugate(singularized_word)
  end

  def self.count(words)
    word_count = {}
    words.each do |word|
      word_count[word] ||= 0
      word_count[word] += 1
    end
    word_count
  end

  def self.remove_stop_words(word_count)
    word_count.except(*stop_words)
  end

  def self.stop_words
    %w(a about above after again against all am an and any are aren't as at be because been before being below between both but by can't cannot could couldn't did didn't do does doesn't doing don't down during each few for from further had hadn't has hasn't have haven't having he he'd he'll he's her here here's hers herself him himself his how how's i i'd i'll i'm i've if in into is isn't it it's its itself let's me more most mustn't my myself no nor not of off on once only or other ought our ours	ourselves out over own same shan't she she'd she'll she's should shouldn't so some such than that that's the their theirs them themselves then there there's these they they'd they'll they're they've this those through to too under until up very was wasn't we we'd we'll we're we've were weren't what what's when when's where where's which while who who's whom why why's with won't would wouldn't you you'd you'll you're you've your yours yourself yourselves) 
  end
end
