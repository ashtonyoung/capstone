class Chapter < ApplicationRecord
  has_many :posts
  has_one :event
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: true

end
