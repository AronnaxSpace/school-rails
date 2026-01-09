class Lesson < ApplicationRecord
  belongs_to :chapter
  has_many :words, dependent: :destroy

  # ActionText for rich content
  has_rich_text :content

  # ActiveStorage for audio
  has_one_attached :audio

  validates :name, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope { order(position: :asc) }
end
