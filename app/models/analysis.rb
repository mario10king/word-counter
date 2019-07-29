class Analysis < ApplicationRecord
  has_one_attached :document

  def count(document)
    word_count = {}
    content = document.read
    words = content.split(" ")
    words.each do |word|
      word_count[word] ||= 0
      word_count[word] += 1
    end
    word_count
  end
end
