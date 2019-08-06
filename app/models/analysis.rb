class Analysis < ApplicationRecord
  has_one_attached :document

  validates :document, presence: true
  validates :words, presence: true

  def common_words(n=25)
    JSON.parse(words).sort_by{ |k, v| -v}.first(n)
  end
end
