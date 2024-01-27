class Chapter < ApplicationRecord
  # TODO: has_many :goals/milestones
  has_many :posts, dependent: :destroy
  has_one :event, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: true

end
