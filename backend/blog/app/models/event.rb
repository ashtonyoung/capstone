class Event < ApplicationRecord
  belongs_to :chapter

  validates :name, presence: true
  validates :chapter_id, presence: true
  validates :chapter_id, uniqueness: true
end
