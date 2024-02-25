class Event < ApplicationRecord
  has_many :chapters, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
end
