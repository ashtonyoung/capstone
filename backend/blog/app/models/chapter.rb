class Chapter < ApplicationRecord
  # TODO: has_many :goals/milestones
  has_many :posts, dependent: :destroy
  belongs_to :event

  validates :name, presence: true
end
