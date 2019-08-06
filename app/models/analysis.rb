class Analysis < ApplicationRecord
  has_one_attached :document

  def common_words(n=25)
    JSON.parse(words).sort_by{ |k, v| -v}.first(n)
  end
end
