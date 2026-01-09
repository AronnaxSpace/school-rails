class Subject < ApplicationRecord
  has_many :chapters, dependent: :destroy

  validates :name, presence: true
end
